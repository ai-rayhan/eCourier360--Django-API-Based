
import 'package:e_courier_360/data/models/delivery_zone.dart';
import 'package:e_courier_360/core/network_caller/network_caller.dart';
import 'package:e_courier_360/core/network_caller/request_methods/put_request.dart';
import 'package:e_courier_360/core/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/global_loading.dart';
import 'package:get/get.dart';

class DeliveryZoneController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  
  List<DeliveryZone> _deliveryZones = [];
  List<DeliveryZone> get deliveryZones=>_deliveryZones;

  DeliveryZone getDeliveryZoneFromId(int deliveryZoneID)=>_deliveryZones.where((delZone) => delZone.id==deliveryZoneID).toList().first;
  
  // Future<bool> getDeliveryZone() async {
  //   _inProgress = true;
  //   update();
  //    final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.deliveryZone,);
  //   _inProgress = false;
  //   if (response.success) {
  //    _deliveryZones = (response.returnValue as List<dynamic>)
  //         .map((json) => DeliveryZone.fromJson(json))
  //         .toList();
  //    _deliveryZones.sort((a, b) => a.name.compareTo(b.name));
  //     update();
  //     return true;
  //   } else {
  //     _errorMessage = response.errorMessage;
  //     update();
  //     return false;
  //   }
  // }
  
  Future<bool> getDeliveryZone({int? branchId}) async {
    _inProgress = true;
    showloading('Loading..');
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute("${Urls.deliveryZone}?branch_id=$branchId",);
    _inProgress = false;
    if (response.success) {
     _deliveryZones = (response.returnValue as List<dynamic>)
          .map((json) => DeliveryZone.fromJson(json))
          .toList();
     _deliveryZones.sort((a, b) => a.name.compareTo(b.name));
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
  
  Future<bool> addDeliveryZone(String name,int branchId) async {
    showloading('Loading..');
    final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.deliveryZone,token: AuthController.token, {
    "name":name ,
    "branch_id": branchId.toString(),
    });
    if (response.success) {
      await getDeliveryZone(branchId: branchId);
      showSuccess("success");
      return true;
    } else {
      showError(response.errorMessage);
      return false;
    }
  }
  Future<bool> updateDeliveryZone(String name,int branchId,int zoneId) async {
    showloading('Loading..');
    final  NetworkCallerReturnObject response =await PutRequest.execute(Urls.updateDeliveryZone(zoneId),token: AuthController.token, {
     "name":name ,
    "branch_id": branchId.toString(),
    });
    if (response.success) {
      await getDeliveryZone(branchId: branchId);
      return true;
    } else {
      showError(response.errorMessage);
      return false;
    }
  }
}
