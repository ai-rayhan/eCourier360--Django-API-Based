import 'package:e_courier_360/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_courier_360/presentation/state_holders/merchant_controller.dart';
import 'package:e_courier_360/presentation/state_holders/rider_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/payment_screen/payment_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/receiver_screen/receivers_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/riders_screen/riders_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/home/home_option_card.dart';
import 'package:e_courier_360/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
List<HomeOptionCard> adminOptions = [
  HomeOptionCard(
      title: "Add Parcel",
      imagePath: HugeIcons.strokeRoundedPackageAdd,
      onTap: () {
        Get.toNamed(RoutePath.sendParcel);
      }),
  HomeOptionCard(
      title: "All Parcel",
      imagePath:HugeIcons.strokeRoundedPackage,
      onTap: () {
        Get.find<MainBottomNavController>().changeIndex(2);
      }),
  HomeOptionCard(
      title: "Merchants",
      imagePath: HugeIcons.strokeRoundedUserMultiple,
      onTap: () {
        Get.lazyPut<MerchantController>(() => MerchantController());
         Get.find<MainBottomNavController>().changeIndex(1);
      }),
      
  HomeOptionCard(
      title: "Riders",
      imagePath: HugeIcons.strokeRoundedUserGroup,
      onTap: () {
        Get.lazyPut<RiderController>(() => RiderController());
        Get.to(const RidersScreen());
      }),
  HomeOptionCard(
      title: "Receivers",
      imagePath:Icons.supervisor_account_rounded,
      onTap: () {
        Get.to(const ReceiversScreen());
      }),

  HomeOptionCard(
      title: "Payment",
      imagePath:Icons.payments_rounded,
      onTap: () {
        Get.to(const AdminPaymentScreen());
      }),
];
