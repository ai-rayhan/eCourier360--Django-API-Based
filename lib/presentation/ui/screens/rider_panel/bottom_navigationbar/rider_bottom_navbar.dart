import 'package:e_courier_360/presentation/ui/base/base_bottom_navigationbar.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/parcels_screen/parcels_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/ui/screens/rider_panel/rider_home_screen/rider_home_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/rider_panel/rider_profile_screen/rider_profile_screen.dart';
import 'package:e_courier_360/presentation/state_holders/category_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_type_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_status_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/pickup_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/receiver_controller.dart';
class RiderBottomNavigationBar extends StatefulWidget {
  const RiderBottomNavigationBar({super.key});

  @override
  State<RiderBottomNavigationBar> createState() =>
      _RiderBottomNavigationBarState();
}

class _RiderBottomNavigationBarState
    extends State<RiderBottomNavigationBar> {
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

  final List<Widget> _screens = const [
    RiderHomeScreen(),
    ParcelsTrackScreen(),
    RiderProfileScren(),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseBottomNavScreen(screens: _screens, items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Parcels'),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), label: 'Profile'),
    ]);
  }
}
