import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/state_holders/category_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_type_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_status_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/merchant_controller.dart';
import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
import 'package:e_courier_360/presentation/state_holders/pickup_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_courier_360/presentation/state_holders/receiver_controller.dart';
import 'package:e_courier_360/presentation/state_holders/tab_navigation_controller.dart';
import 'package:e_courier_360/presentation/state_holders/update_status_controller.dart';
import 'package:get/get.dart';


class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(AuthController());

    // Get.put(SendPhoneOtpController());
    // Get.put(VerifyOTPController());
    // Get.put(OtpTimeDecreaseController());

    Get.put(PickUpZoneController());
    Get.put(CategoryController());
    Get.put( DeliveryZoneController());
    Get.put( ParcelController());
    Get.put( ParcelStatusController());
    Get.put( DeliveryTypeInfoController());
    Get.put( ReceiverController());
    Get.put( DeliveryStatusController());
    // Get.put( ProductController());
    Get.put( TabNavigationController());
    Get.put( MerchantController());
    
  }
}
