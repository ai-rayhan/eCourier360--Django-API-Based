import 'package:e_courier_360/core/network_caller/request_methods/post_request.dart';
import 'package:e_courier_360/core/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:get/get.dart';

class SendPhoneOtpController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  Future<bool> sendOtpToPhone(String phone) async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.sendOtpToPhone, {
        'phone_number':phone,
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
