import 'package:e_courier_360/presentation/state_holders/local/onboard_controller.dart';
import 'package:get/get.dart';

class OnboardBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<OnBoardingController>(
      () => OnBoardingController(),
    );
}}