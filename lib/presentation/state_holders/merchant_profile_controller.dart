import 'dart:io';
import 'package:e_courier_360/data/models/shop.dart';
import 'package:e_courier_360/data/models/user_profile.dart';
import 'package:e_courier_360/data/services/network_caller/multipart_converter.dart';
import 'package:e_courier_360/data/services/network_caller/network_caller.dart';
import 'package:e_courier_360/data/services/network_caller/request_methods/put_request.dart';
import 'package:e_courier_360/data/services/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class MerchantProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  List <Shop> _shops=[];
  List <Shop> get shops=>_shops;
  Future<bool> createMerchantProfile(String name,String phone,String bussinessAddress) async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.createMerchant, {
        "merchant_name": name,
        "bussiness_contact_info":phone,
        "bussiness_address":bussinessAddress,
    }, isLogin: true);
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

  User? _user;
  User? get currentUser=>_user;

  Future<bool> getProfile() async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.viewProfile,);
    _inProgress = false;
    if (response.success) {
      _user= User.fromJson(response.returnValue);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
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

  
  Future<bool> addShop(String shopName,String shopEmail,String shopAddress,int pickupZone,String pickupPhone) async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.addShop, token: AuthController.token, {
      // "user": '2',
      // "merchant": '2',
      "shop_name": shopName,
      "shop_email": shopEmail,
      "shop_address": shopAddress,
      "pickup_zone": pickupZone.toString(),
      "pickup_phone": pickupPhone

    }, isLogin: true);
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
  Future<bool> getShops() async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.addShop, token: AuthController.token,);
    _inProgress = false;
    if (response.success) {
     _shops = (response.returnValue as List<dynamic>)
          .map((json) => Shop.fromJson(json))
          .toList();
     _shops.sort((a, b) => a.id.compareTo(b.id));
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
  Future<bool> updateShop(String shopName,String shopEmail,String shopAddress,int pickupZone,String pickupPhone,int shopid) async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await PutRequest.execute(Urls.updateShop(shopid), token: AuthController.token, {
      // "user": '2',
      // "merchant": '2',
      "shop_name": shopName,
      "shop_email": shopEmail,
      "shop_address": shopAddress,
      "pickup_zone": pickupZone.toString(),
      "pickup_phone": pickupPhone

    }, isLogin: true);
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
}
