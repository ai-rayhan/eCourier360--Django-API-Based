import 'dart:convert';
import 'dart:developer';

import 'package:e_courier_360/data/models/profile.dart';
import 'package:e_courier_360/data/services/network_caller/request_methods/post_request.dart';
import 'package:e_courier_360/data/services/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/auth/verify_phone_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static String? token;
  static String? userId;
  static String? merchantId;
  static String? mcid='1';
  static String? userRole='Merchent';
  UserProfile? profile;
  bool _isPhoneVerifiedUser =false;
  bool get isPhoneVerifiedUser =>_isPhoneVerifiedUser;

  bool _inProgress=false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
 
  Future<bool> signUp(String name,String email,String phone,String password) async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.signup, {
        'username':name,
        'email' : email,
        'password' : password,
        'phone_number':phone,
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
      saveUserDetails( response.returnValue['data']['access'], UserProfile.fromJson(response.returnValue['data']),response.returnValue['data']['id'].toString());
      saveVerification(response.returnValue['data']['is_phone_verified']);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

  Future<void> saveUserDetails(String userToken, UserProfile userProfile,String uid) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', userToken);
    await sharedPreferences.setString('profile', jsonEncode(userProfile.toJson()));
    await sharedPreferences.setString('uid', uid);
    token = userToken;
    profile = userProfile;
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