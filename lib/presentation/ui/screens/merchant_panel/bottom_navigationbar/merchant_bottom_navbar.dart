
import 'package:e_courier_360/presentation/state_holders/category_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_type_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_status_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/pickup_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/receiver_controller.dart';
import 'package:e_courier_360/presentation/ui/base/base_bottom_navigationbar.dart';
import 'package:e_courier_360/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchantBottomNavigationBar extends StatefulWidget {
  const MerchantBottomNavigationBar({super.key});

  @override
  State<MerchantBottomNavigationBar> createState() =>
      _MerchantBottomNavigationBarState();
}

class _MerchantBottomNavigationBarState
    extends State<MerchantBottomNavigationBar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<DeliveryStatusController>().getDeliveryStatus();
      await Get.find<PickUpZoneController>().getPickupZone();
      await Get.find<DeliveryZoneController>().getDeliveryZone();
      await Get.find<ReceiverController>().getReceivers();
      await Get.find<CategoryController>().getCategories();
      await Get.find<DeliveryTypeInfoController>().getDeliveryTypeInfo();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return const BaseBottomNavScreen(initialRoute:RoutePath.merchantHome, items: [
      BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Calculate'),
      BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Parcels'),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), label: 'Profile'),
    ]);
  }
}
