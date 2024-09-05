
import 'package:e_courier_360/presentation/state_holders/category_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_status_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_type_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_courier_360/presentation/state_holders/merchant_controller.dart';
import 'package:e_courier_360/presentation/state_holders/pickup_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/receiver_controller.dart';
import 'package:e_courier_360/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/ui/base/base_bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class AdminBottomNavigationBar extends StatefulWidget {
  const AdminBottomNavigationBar({super.key});

  @override
  State<AdminBottomNavigationBar> createState() =>
      _AdminBottomNavigationBarState();
}

class _AdminBottomNavigationBarState
    extends State<AdminBottomNavigationBar> {
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
      // await Get.find<RiderController>().getAllRiders();
      await Get.find<MerchantController>().getAllMerchants();
    });
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return BaseBottomNavScreen(
          initialRoute:RoutePath.adminHome,
          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(HugeIcons.strokeRoundedUserMultiple), label: 'Merchants'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Parcels'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ]);
      }
    );
  }
}
