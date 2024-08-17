import 'dart:developer';

import 'package:e_courier_360/data/models/parcel.dart';
import 'package:e_courier_360/data/models/body/parcel_data.dart';
import 'package:e_courier_360/data/models/product.dart';
import 'package:e_courier_360/data/models/tracking_parcel.dart';
import 'package:e_courier_360/core/network_caller/request_methods/get_request.dart';
import 'package:e_courier_360/core/network_caller/request_methods/post_request.dart';
import 'package:e_courier_360/core/network_caller/request_methods/put_request.dart';
import 'package:e_courier_360/core/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/pickup_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/product_controller.dart';
import 'package:get/get.dart';

class ParcelController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<Parcel> _parcels = [];
  List<Parcel> get parcels=>_parcels;

  late Parcel _parcel;
  Parcel get parcel=>_parcel;

  Future<bool> getMerchantParcels() async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.merchantParcels,);
    _inProgress = false;
    if (response.success) {
     _parcels = (response.returnValue as List<dynamic>)
          .map((json) => Parcel.fromJson(json))
          .toList();
     _parcels.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

  Future<bool> getParcelsByStatus(int statusId) async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.getParcels(statusId),);
    _inProgress = false;
    if (response.success) {
     _parcels = (response.returnValue as List<dynamic>)
          .map((json) => Parcel.fromJson(json))
          .toList();
     _parcels.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
  
  List<ParcelStatus> _parcelUpdateList = [];
  List<ParcelStatus> get parcelUpdateList=>_parcelUpdateList;
  Future<bool> trackingParcel(String voucherId) async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.trackingParcel(voucherId),);
    _inProgress = false;
    if (response.success) {
     _parcelUpdateList= (response.returnValue as List<dynamic>)
          .map((json) => ParcelStatus.fromJson(json))
          .toList();
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

  Future<bool> addParcel(ParcelData parcelData,List<Product> productList,String merchantId) async {
   int pickupZoneId= Get.find<PickUpZoneController>().pickupZones.where((element) => element.name==parcelData.pickupLocation).toList().first.id;
   int deliveryZoneId= Get.find<DeliveryZoneController>().deliveryZones.where((element) => element.name==parcelData.deliveryZone).toList().first.id;
    _inProgress = true;
    update();
    final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.addParcel,token: AuthController.token, {

    "pickup_address": parcelData.pickupLocation,
    "cod": parcelData.cod,
    "parcel_equivalent_price": parcelData.sellingPrice,
    "merchant": merchantId,
    "merchant_invoice_id": parcelData.invoiceId,
    "receiver": parcelData.customerId.toString(),
    "pickup_zone": pickupZoneId.toString(),
    "delivery_zone": deliveryZoneId.toString(),
    "delivery_charge": parcelData.deliveryCharge.toStringAsFixed(2),
    "delivery_address": parcelData.receiverAddress,
    "date": "2024-04-17",  
    }, isLogin: true);
    bool response2= await Get.find<ProductController>().addProduct(productList,response.returnValue['id'],);
    _inProgress = false;
    if (response.success&& response2) {
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

  Future<bool> updateParcel(ParcelData parcelData,List<Product> productList,int parcelId,String merchantId) async {
   int pickupZoneId= Get.find<PickUpZoneController>().pickupZones.where((element) => element.name==parcelData.pickupLocation).toList().first.id;
   int deliveryZoneId= Get.find<DeliveryZoneController>().deliveryZones.where((element) => element.name==parcelData.deliveryZone).toList().first.id;
    _inProgress = true;
    update();
    final  NetworkCallerReturnObject response =await PutRequest.execute(Urls.updateParcel(parcelId),token: AuthController.token, {

    "pickup_address": parcelData.pickupLocation,
    "cod": parcelData.cod,
    "parcel_equivalent_price": '344',
    "merchant": merchantId,
     "merchant_invoice_id": parcelData.invoiceId,
    // "user": null,
    "receiver": parcelData.customerId.toString(),
    "pickup_zone": pickupZoneId.toString(),
    "delivery_zone": deliveryZoneId.toString(),
    "delivery_charge": parcelData.deliveryCharge.toStringAsFixed(2),
    "delivery_address": parcelData.receiverAddress,
    "date": "2024-04-17",  
    }, isLogin: true);
    bool response2= await Get.find<ProductController>().updateProduct(productList,response.returnValue['id'],);
    _inProgress = false;
    if (response.success&& response2) {
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
  final List<Parcel> _allStatusParcels=[];
  List<Parcel> get allStatusParcels=> _allStatusParcels;
  
  List<Parcel>get riderPendingBooking=>_allStatusParcels.where((element) => element.driverPaymentStatus==1).toList();
  List<Parcel>get merchantPendingBooking=>_allStatusParcels.where((element) => element.paymentStatus==1).toList();

    Future<void> getParcelsByMultipleStatuses(List<int> statusIdsList) async {
    _allStatusParcels.clear();
    for (var statusId in statusIdsList) {
      bool success = await getParcelsByStatus(statusId);
      _allStatusParcels.addAll(_parcels);
      _allStatusParcels.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      if (success) {
        log("Successfully fetched parcels for status IDs: $statusId");
        // Additional logic for handling the data can be added here
      } else {
        log("Failed to fetch parcels for status IDs: $statusId");
        // Additional logic for handling errors can be added here
      }
    }
  }
}