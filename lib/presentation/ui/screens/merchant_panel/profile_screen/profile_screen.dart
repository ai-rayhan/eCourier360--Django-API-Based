import 'package:e_courier_360/presentation/ui/base/profile_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/merchant_panel/profile_screen/customer_address_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/merchant_panel/profile_screen/edit_profile_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/profile/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchantProfileScreen extends StatelessWidget {
  const MerchantProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
        child: Column(
      children: [
        ProfileCard(
            title: "Edit Profile",
            subtitle: "Edit Name,address etc.",
            iconData: Icons.account_circle_outlined,
            hasDivider: false,
            ontap: () {
              // Get.to(const EditProfileScreen());
            }),
        ProfileCard(
            title: "Customer Address book",
            subtitle: "See Customer Address book",
            iconData: Icons.ballot_outlined,
            ontap: () {
              Get.to(const CustomerAddressScreen());
            }),
      ],
    ));
  }
}
