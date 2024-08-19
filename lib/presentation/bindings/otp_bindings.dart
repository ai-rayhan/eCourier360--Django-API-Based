
import 'package:e_courier_360/presentation/state_holders/otp_time_decrease_controller.dart';
import 'package:e_courier_360/presentation/state_holders/send_phone_otp_controller.dart';
import 'package:e_courier_360/presentation/state_holders/verify_otp_controller.dart';
import 'package:get/get.dart';

class SendOTPBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut<SendPhoneOtpController>(() => SendPhoneOtpController());
      Get.lazyPut<VerifyOTPController>(() => VerifyOTPController());
      Get.lazyPut<OtpTimeDecreaseController>(() => OtpTimeDecreaseController());
  }
}