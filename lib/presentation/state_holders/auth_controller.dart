import 'dart:convert';
import 'dart:developer';

import 'package:e_courier_360/data/models/profile.dart';
import 'package:e_courier_360/data/services/network_caller/request_methods/dynamic_post_request.dart';
import 'package:e_courier_360/data/services/network_caller/request_methods/post_request.dart';
import 'package:e_courier_360/data/services/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/auth/verify_phone_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static String? token;
  static String? userId;
  // static String? merchantId;
  static String? mcid='1';
  static int? userRole=1;
  static bool? isActiveUser=true;
  UserProfile? profile;
  bool _isPhoneVerifiedUser =false;
  bool get isPhoneVerifiedUser =>_isPhoneVerifiedUser;

  bool _inProgress=false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
 
  Future<bool> signUp(String name,String email,String phone,String password,String userType,Map<String,dynamic> businessInfo) async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await DynamicPostRequest.execute(Urls.signup, {
        'username':name,
        'email' : email,
        'password' : password,
        'phone_number':phone,
        "user_type":userType,
         userType:businessInfo,

    }, isLogin: false);
    _inProgress = false;
    if (response.success) {
      userId=response.returnValue['id'].toString();
      _tempEmail=email;
      _tempPassword=password;
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

  String? _tempPassword, _tempEmail;
  String? get tempPassword => _tempPassword;
  String? get tempEmail => _tempEmail;

  Future<bool> logIn(String email,String password) async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.signin, {
        'email' : email,
        'password' : password,
    }, isLogin: false);
    _inProgress = false;
    if (response.success) {
      log("message:${response.returnValue['data']}");
      saveUserDetails( response.returnValue['data']['access'], UserProfile.fromJson(response.returnValue),response.returnValue['data']['id'].toString());
      saveVerification(response.returnValue['data']['is_phone_verified']);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

  Future<bool> merchantRegister({required String username,required String fullName,required String shopName,required String shopEmail,required String shopAddress,required String pickupPhone,required String pickupAddress}) async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.merchantRegister, {
    "fullname":fullName,
    "shop_name":shopName,
    "shop_address":shopAddress,
    "pickup_address":pickupAddress,
    "shop_email":shopEmail,
    "username":username,
    "pickup_phone":pickupPhone
    }, isLogin: false);
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
 
  Future<bool> riderRegister({required String username,required String fullName,required String registrationNo,required String email,required String address,required String phone,required String vehicleType}) async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.riderRegister, {
    "username": username,
    "full_name":fullName,
    "email": email,
    "phone": phone,
    "address": address,
    "vehicle_type": vehicleType,
    "registration_number": registrationNo,
    // "rider_commission": 10
    }, isLogin: false);
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



  // Future<bool> logIn(String userName,String password) async {
  //   _inProgress = true;
  //   update();
  //    final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.signin, {
  //       'username' : userName,
  //       'password' : password,
  //   }, isLogin: false);
  //   _inProgress = false;
   
  //   if (response.success) {
  //     LoginResponse  reponseData=LoginResponse.fromJson(response.returnValue);
  //     token=reponseData.data.token;
  //     userRole=reponseData.data.user.roles![0].name;
  //     saveUserDetails(reponseData);
  //     update();
  //     return true;
  //   } else {
  //     _errorMessage = response.errorMessage;
  //     update();
  //     return false;
  //   }
  // }
  Future<void> saveUserDetails(String userToken, UserProfile userProfile,String uid) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', userToken);
    await sharedPreferences.setString('profile', jsonEncode(userProfile.toJson()));
    await sharedPreferences.setString('uid', uid);
    token = userToken;
    profile = userProfile;
    userRole=userProfile.data?.role;
    userId=uid;
    log("ueiytrueyntre yt "+userProfile.toString());
  }

  Future<void> saveVerification(bool isPhoneVerified) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('is_phone_verified', isPhoneVerified);
  }

  Future<void> initialize() async {
    token = await _getToken();
    profile = await _getProfile();
    _isPhoneVerifiedUser = await _checkIsphoneVerified();
    userRole = profile?.data?.role;
  }

  Future<bool> isLoggedIn() async {
    await initialize();
    return token != null;
  }

  bool get isTokenNotNull => token != null;

  Future<String?> _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    log("Token:${sharedPreferences.getString('token').toString()}");
    return sharedPreferences.getString('token');
  }
  Future<bool> _checkIsphoneVerified() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool('is_phone_verified')??false;
  }

  Future<UserProfile?> _getProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? strProfile = sharedPreferences.getString('profile');
    if (strProfile == null) {
      return null;
    } else {
      return UserProfile.fromJson(jsonDecode(strProfile));
    }
  }

  static Future<void> clearAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    token == null;
  }

  static Future<void> goToLogin() async {
    Get.to(() => const VerifyPhoneScreen());
  }

  Future<bool> createMerchant(String name,String phone,String address) async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.createMerchant, {
         "merchant_name": name,
         "bussiness_contact_info": phone,
         "bussiness_address": address,
    }, token: token);
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
saveMerchantProfile(String mcid)async{
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   sharedPreferences.setString("mcid", mcid);
}
}