import 'dart:io';
import 'package:e_courier_360/data/models/rider.dart';
import 'package:e_courier_360/core/network_caller/multipart_converter.dart';
import 'package:e_courier_360/core/network_caller/network_caller.dart';
import 'package:e_courier_360/core/network_caller/request_methods/dynamic_post_request.dart';
import 'package:e_courier_360/core/network_caller/request_methods/put_request.dart';
import 'package:e_courier_360/core/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class RiderController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Future<bool> createMerchantProfile(String name,String phone,String bussinessAddress) async {
  //   _inProgress = true;
  //   update();
  //    final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.createMerchant, {
  //       "merchant_name": name,
  //       "bussiness_contact_info":phone,
  //       "bussiness_address":bussinessAddress,
  //   }, isLogin: true);
  //   _inProgress = false;
  //   if (response.success) {
  //     update();
  //     return true;
  //   } else {
  //     _errorMessage = response.errorMessage;
  //     update();
  //     return false;
  //   }
  // }

    Future<bool> updateProfile(String name,String phone,String address,File imageFile) async {
    _inProgress = true;
    update();
    final multipartFile = await MultipartConverter().imageToMultipartConverter(imageFile, 'photo');
     final  NetworkCallerReturnObject response =await PutRequest.execute(Urls.updateProfile,images: [multipartFile] ,{
         "full_name": name,
         "phone_number": phone,
         "address": address,
    },  token: AuthController.token);
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

  List <Rider> _riders=[];
  List <Rider> get riderList=>_riders;
  Future<bool> getAllRiders() async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.riders, token: AuthController.token,);
    _inProgress = false;
    if (response.success) {
     _riders = (response.returnValue as List<dynamic>)
          .map((json) => Rider.fromJson(json))
          .toList();
     _riders.sort((a, b) => a.id.compareTo(b.id));
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

  Rider? _rider;
  Rider? get riderDetails=>_rider;
  Future<bool> getRiderDetails(int riderId) async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.riderDetails(riderId), token: AuthController.token,);
    _inProgress = false;
    if (response.success) {
     _rider = Rider.fromJson(response.returnValue);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

  List<int>riderIDList=[];
  int? selectedStatus;

  updateRiderId(int riderID){
    if(riderIDList.contains(riderID)){
      riderIDList.remove(riderID);
    }else{
      riderIDList.add(riderID);
    }
    update();
  }

  Future<bool> activateRider() async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await DynamicPostRequest.execute(Urls.riderActivate, token: AuthController.token,{
         "status":selectedStatus,
         "riders_id":riderIDList

     });
    _inProgress = false;
    if (response.success) {
     riderIDList.clear();
     selectedStatus=null;
     getAllRiders();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

List<String> get riderNames=> _riders.map((driver) => driver.fullName).toList();
List<int> get riderIds=> _riders.map((driver) => driver.id).toList();
int getRiderId(String riderName)=>_riders.where((driver) =>driver.fullName==riderName ).toList().first.id;

List <String> get combinedRiders{
  List<Rider> drivers= _riders;
  List<String> combined=[];
  for (Rider driver in drivers){
    combined.add("${driver.fullName}-(${driver.phone})");
  }
  return combined;
}

//   Future<bool> updateShop(String shopName,String shopEmail,String shopAddress,int pickupZone,String pickupPhone,int shopid) async {
//     _inProgress = true;
//     update();
//      final  NetworkCallerReturnObject response =await PutRequest.execute(Urls.updateShop(shopid), token: AuthController.token, {
//       // "user": '2',
//       // "merchant": '2',
//       "shop_name": shopName,
//       "shop_email": shopEmail,
//       "shop_address": shopAddress,
//       "pickup_zone": pickupZone.toString(),
//       "pickup_phone": pickupPhone

//     }, isLogin: true);
//     _inProgress = false;
//     if (response.success) {
//       update();
//       return true;
//     } else {
//       _errorMessage = response.errorMessage;
//       update();
//       return false;
//     }
//   }
}
