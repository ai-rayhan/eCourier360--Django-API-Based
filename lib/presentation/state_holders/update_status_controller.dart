import 'package:e_courier_360/data/models/parcel.dart';
import 'package:e_courier_360/core/network_caller/request_methods/dynamic_post_request.dart';
import 'package:e_courier_360/core/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class ParcelStatusController extends GetxController {
  ////////////// State Handler///////////
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

    Future<bool> updateStatusByBatch({int? pickupRider,int? deliveryRider,int? partialCash,String? reason}) async {
    _inProgress = true;
    update();
    final  NetworkCallerReturnObject response =await DynamicPostRequest.execute(Urls.updateStatusByBatch,token: AuthController.token,{
   
    "parcel_ids": bookingIds,
    "status":_selectedStatusId,
    "pickup_rider":pickupRider,
    "delivery_rider":deliveryRider,
    "partial_collection_amount":partialCash,
    "reason":reason,
    "delivery_amount":null,
    "receiver_id":null
    } , isLogin: true);
    _inProgress = false;
    if (response.success) {
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

    Future<bool> makeMerchantPayment({String? paymentMethod,double? amount}) async {
    _inProgress = true;
    update();
    final  NetworkCallerReturnObject response =await DynamicPostRequest.execute(Urls.makeMerchantPayment,token: AuthController.token,{
    "merchant_id": selectedParcels.first.merchant,
    "payment_method": 1,
    "payment": amount,
    "parcels_id": [selectedParcels.first.id],
    "status": 12,
    "payment_note": "Payment Made By Admin",
    "note": "Monthly settlement"

    // "parcels_id": [2],
    // "merchant_id":1,
    // "status":12,
    // "payment_method": 1,
    // "payment":2100,
    // "payment_note": "Payment Made By Admin",
    // "note": "Monthly settlement"
    } , isLogin: true);
    if (response.success) {
    //  if(selectedParcels.first.driverPaymentStatus==2){
    //   updateStatusByBatch();
    // }
      _inProgress = false;
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
    Future<bool> makeRiderPayment({String? paymentMethod}) async {
    _inProgress = true;
    update();
    final  NetworkCallerReturnObject response =await DynamicPostRequest.execute(Urls.makeRiderPayment,token: AuthController.token,{

        // "drider_id": selectedParcels.first.driver,
        // "booking_id" : ["${selectedParcels.first.id}"],
        // "payment_method" : [1],
        // "payment" : ["${selectedParcels.first.cashCollection}"],
        // "payment_note" : ["Payment Made By Admin"]

        "drider_id": selectedParcels.first.driver,
        "parcels_id" : [selectedParcels.first.id],
        "payment_method" : 1,
        "payment" : selectedParcels.first.cod,
        "status" : 12,
        "payment_note" : "Payment Made By Admin"

    } , isLogin: true);
 
    if (response.success) {
    _inProgress = false;
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
  

int? _selectedStatusId;
int? get selectedStatusId=>_selectedStatusId;
set selectedStatusId(int? newId){
  _selectedStatusId=newId;
  update();
  }
 ///////////////////// Update status//////////
 
  int paymentTabID=0; //Payment To "Merchant" and  "Rider"
 updatePaymentTabId(int tabId){
  paymentTabID=tabId;
}
  List<Parcel> selectedParcels =[];
  List <String> get bookingIds=>selectedParcels.map((parcel) => parcel.id.toString()).toList();
  bool isSelected(Parcel parcel) {
    return selectedParcels.contains(parcel);
  }

  void toggleSelection( parcel) {
    if (selectedParcels.contains(parcel)) {
      selectedParcels.remove(parcel);
    } else {
      selectedParcels.add(parcel);
    }
    update();
  }

 bool isSelectionMode() {
    return selectedParcels.isNotEmpty;
  }
  void clearSelection() {
    selectedParcels.clear();
    bookingIds.clear();
    update();
  }
  void uiclearSelection() {
    selectedParcels.clear();
    bookingIds.clear();
    update();
  }

}
