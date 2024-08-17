import 'package:e_courier_360/presentation/state_holders/delivery_status_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/pickup_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/product_controller.dart';
import 'package:get/get.dart';


class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryStatusController>(
      () => DeliveryStatusController(),
    );
    Get.lazyPut<PickUpZoneController>(
      () => PickUpZoneController(),
    );
    Get.lazyPut<DeliveryZoneController>(
      () => DeliveryZoneController(),
    );
    Get.lazyPut<DeliveryZoneController>(
      () => DeliveryZoneController(),
    );
    Get.put(ProductController());
  }
}