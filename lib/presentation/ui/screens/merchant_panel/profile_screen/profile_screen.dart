import 'package:e_courier_360/presentation/ui/base/base_settings_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/merchant_panel/profile_screen/customer_address_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/merchant_panel/profile_screen/edit_profile_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/settings/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchantProfileScreen extends StatelessWidget {
  const MerchantProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SettingsScreen(
        child: Column(
      children: [
        SettingsCard(
            title: "Edit Profile",
            subtitle: "Edit Name,address etc.",
            iconData: Icons.account_circle_outlined,
            hasDivider: false,
            ontap: () {
              // Get.to(const EditProfileScreen());
            }),
        SettingsCard(
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
