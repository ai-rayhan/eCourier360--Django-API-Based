
import 'dart:developer';
import 'package:e_courier_360/data/models/delivery_type_info.dart';
import 'package:e_courier_360/data/models/product.dart';
import 'package:e_courier_360/data/services/network_caller/network_caller.dart';
import 'package:e_courier_360/data/services/network_caller/request_methods/put_request.dart';
import 'package:e_courier_360/data/services/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/global_loading.dart';

import 'package:get/get.dart';

class DeliveryTypeInfoController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  
  List<DeliveryInfo> _deliveryTypes = [];
  List<DeliveryInfo> get deliveryTypes=>_deliveryTypes;
  DeliveryInfo getDeliveryTypeFromId(int deliveryTypeID)=>_deliveryTypes.where((delType) => delType.id==deliveryTypeID).toList().first;
  DeliveryInfo getDeliveryTypeFromName(String deliveryType)=>_deliveryTypes.where((delType) => delType.deliveryType==deliveryType).toList().first;
  
  // Future<bool> getDeliveryTypeInfo() async {
  //   _inProgress = true;
  //   update();
  //    final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.deliveryChargeInfo,);
  //   _inProgress = false;
  //   log("calledd");
  //   if (response.success) {
  //     List<dynamic> data=response.returnValue;
  //    _deliveryTypes = data.map((deliveryTypeJson) => DeliveryInfo.fromJson(deliveryTypeJson)).toList();
  //     _deliveryTypes.sort((a, b) => a.deliveryType.compareTo(b.deliveryType));
  //     log(_deliveryTypes.toString());
  //     update();
  //     return true;
  //   } else {
  //     _errorMessage = response.errorMessage;
  //     update();
  //     return false;
  //   }
  // }

  Future<bool> getDeliveryTypeInfo() async {
    _inProgress = true;
    showloading('Loading..');
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.deliveryType);
    _inProgress = false;
    if (response.success) {
     List<dynamic> data=response.returnValue;
     _deliveryTypes = data.map((deliveryTypeJson) => DeliveryInfo.fromJson(deliveryTypeJson)).toList();
      _deliveryTypes.sort((a, b) => a.deliveryType.compareTo(b.deliveryType));
      update();
      showSuccess("success");
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      showError(response.errorMessage);
      return false;
    }
  }
  
  Future<bool> addDeliveryType(Map<String,String> deliveryTypeJson) async {
    showloading('Loading..');
    final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.deliveryType,token: AuthController.token, deliveryTypeJson);
    if (response.success) {
      await getDeliveryTypeInfo();
      showSuccess("success");
      return true;
    } else {
      showError(response.errorMessage);
      return false;
    }
  }
  Future<bool> updateDeliveryType(Map<String,String> deliveryTypeJson,int deliveryTypeId) async {
    showloading('Loading..');
    final  NetworkCallerReturnObject response =await PutRequest.execute(Urls.updateDeliveryType(deliveryTypeId),token: AuthController.token,deliveryTypeJson);
    if (response.success) {
      await getDeliveryTypeInfo();
      return true;
    } else {
      showError(response.errorMessage);
      return false;
    }
  }

//////////////////////////Parcel charge Calculations//////////////////

 double _chargeWithCOD=0.0;
 double get chargeWithCOD=>_chargeWithCOD;
 double _totalCharge=0.0;
 double get totalCharge=>_totalCharge;
  String getTotalCharge(List <Product> products, int deliveryTypeId,String casAmountCOD){
    // int deliveryTypeId=deliveryTypes.where((dt) => dt.deliveryType==deliveryType).toList().first.id??0;
    // int deliveryTypeId=1;
    double cashCOD=double.tryParse(casAmountCOD)??0;
    double productCharge=0.0;
     for(Product product in products){
      double weight=double.tryParse(product.weight!)??0.0;
      double height=double.tryParse(product.height!)??0.0;
      double width=double.tryParse(product.width!)??0.0;
      double quantity=double.tryParse(product.quantity!)??0.0;

      double perProduct=(weight*deliveryTypes[deliveryTypeId].perKgWeight)+(height*deliveryTypes[deliveryTypeId].perHeight)+(width*deliveryTypes[deliveryTypeId].perWidth);
      double charge=perProduct*quantity;
      productCharge=productCharge+charge;
     }
      _chargeWithCOD=((cashCOD*deliveryTypes[deliveryTypeId].cashCollectionChargePercent)/100)+productCharge;
      _totalCharge=_chargeWithCOD+deliveryTypes[deliveryTypeId].basicCharge;
     return chargeWithCOD.toStringAsFixed(2);
  }

  String calcaculationResult(DeliveryInfo deliveryInfo,double height,double width,double weight ){
  double result=(weight*deliveryInfo.perKgWeight)+(height*deliveryInfo.perHeight)+(width*deliveryInfo.perWidth);
    return result.toStringAsFixed(2);
  }
}
