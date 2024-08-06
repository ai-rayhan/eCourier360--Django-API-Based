import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/state_holders/category_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_type_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_status_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/local/onboard_controller.dart';
import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
import 'package:e_courier_360/presentation/state_holders/pickup_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_courier_360/presentation/state_holders/merchant_profile_controller.dart';
import 'package:e_courier_360/presentation/state_holders/otp_time_decrease_controller.dart';
import 'package:e_courier_360/presentation/state_holders/product_controller.dart';
import 'package:e_courier_360/presentation/state_holders/receiver_controller.dart';
import 'package:e_courier_360/presentation/state_holders/send_phone_otp_controller.dart';
import 'package:e_courier_360/presentation/state_holders/tab_navigation_controller.dart';
import 'package:e_courier_360/presentation/state_holders/update_status_controller.dart';
import 'package:e_courier_360/presentation/state_holders/verify_otp_controller.dart';
import 'package:get/get.dart';


class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(AuthController());
    Get.put(OnBoardingController());
    Get.put(SendPhoneOtpController());
    // Get.put(MerchantProfileController());
    Get.put(VerifyOTPController());
    Get.put(OtpTimeDecreaseController());

    Get.put(PickUpZoneController());
    Get.put(CategoryController());
    Get.put( DeliveryZoneController());
    Get.put( ParcelController());
    Get.put( ParcelStatusController());
    // Get.put( StepperController());
    Get.put( DeliveryTypeInfoController());
    Get.put( ReceiverController());
    // Get.put( ParcelDataController());
    Get.put( DeliveryStatusController());
    Get.put( ProductController());
    Get.put( TabNavigationController());
    
  }
}
