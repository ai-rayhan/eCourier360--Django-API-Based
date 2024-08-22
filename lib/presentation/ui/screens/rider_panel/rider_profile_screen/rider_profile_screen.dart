import 'package:e_courier_360/presentation/state_holders/rider_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/rider_panel/rider_profile_screen/rider_edit_profile_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/settings/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/ui/base/base_settings_screen.dart';
import 'package:get/get.dart';
class RiderProfileScren extends StatelessWidget {
  const RiderProfileScren({super.key});

  @override
  Widget build(BuildContext context) {
    return   SettingsScreen(child: 
    Column(children: [
      SettingsCard(title: "Edit Profile", subtitle: 'Change profile information', iconData: Icons.account_box_outlined, 
      ontap: (){
        Get.lazyPut<RiderController>(() => RiderController());
        Get.to(const RiderEditProfileScren());
      }
      )
    ],)
    );
  }
}