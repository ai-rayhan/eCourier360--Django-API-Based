import 'package:e_courier_360/presentation/ui/base/base_settings_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/settings_screen/branches/branches_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/settings/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsScreen(
        child: Column(
      children: [
        SettingsCard(
            title: "Branches and Zones",
            subtitle: "Branches and Pickup-Delivery Zones",
            iconData: Icons.grass,
            ontap: () {
              Get.to(const BranchesScreen());
            }),
        // SettingsCard(
        //     title: "Pickup Zones",
        //     subtitle: "Exit from app",
        //     iconData: Icons.logout,
        //     ontap: () {}),
        // SettingsCard(
        //     title: "Delivery Zones",
        //     subtitle: "Exit from app",
        //     iconData: Icons.logout,
        //     ontap: () {}),
        SettingsCard(
            title: "Delivery Types",
            subtitle: "Delivery type to control costs",
            iconData: Icons.local_shipping_outlined,
            ontap: () {}),
        SettingsCard(
            title: "Product Types",
            subtitle: "Product category which deliver",
            iconData: Icons.category_outlined,
            ontap: () {}),
        // SettingsCard(
        //     title: "Rise Issue",
        //     subtitle: "Exit from app",
        //     iconData: Icons.report_problem_outlined,
        //     ontap: () {}),
        SettingsCard(
            title: "System Config",
            subtitle: "Manage app system settings,Appname",
            iconData: Icons.settings_brightness_rounded,
            ontap: () {}),
        SettingsCard(
            title: "Roles and permissions",
            subtitle: "Manage Roles and User Permissions",
            iconData: Icons.admin_panel_settings_outlined,
            ontap: () {}),
      ],
    ));
  }
}
