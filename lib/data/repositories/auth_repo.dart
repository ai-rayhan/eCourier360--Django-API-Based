import 'package:e_courier_360/core/network_caller/request_methods/dynamic_post_request.dart';
import 'package:e_courier_360/core/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';

class AuthRepo {
 Future<NetworkCallerReturnObject> signUp(String name,String email,String phone,String password,String userType,Map<String,dynamic> businessInfo)async{
      final  NetworkCallerReturnObject response =await DynamicPostRequest.execute(Urls.signup, {
        'username':name,
        'email' : email,
        'password' : password,
        'phone_number':phone,
        "user_type":userType,
         userType:businessInfo,

    }, isLogin: false);
      return response;
  }
}