import 'package:e_courier_360/presentation/state_holders/parcel_data_controller.dart';
import 'package:e_courier_360/presentation/state_holders/stepper_controller.dart';
import 'package:get/get.dart';


class SendParcelBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut<StepperController>(() => StepperController());
      Get.lazyPut<ParcelDataController>(() => ParcelDataController());
  }
}