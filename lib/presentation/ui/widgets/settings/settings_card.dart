import 'package:e_courier_360/data/models/branch.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/settings_screen/branches/edit_branch_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/settings_screen/deliveryzone/delivery_zone_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/settings_screen/pickupzone/pickup_zone_screen.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconData,
    required this.ontap,
    this.trailling,
    this.hasDivider,
  });
  final String title;
  final String subtitle;
  final IconData iconData;
  final VoidCallback ontap;
  final bool? hasDivider;
  final Widget? trailling;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        hasDivider == null
            ? Divider(
                height: 5,
                color: Colors.grey[200],
              )
            : Container(),
        GestureDetector(
          onTap: ontap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  // backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    iconData,
                    color: AppColors.secondaryColor.withOpacity(.6),
                    size: 25,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.darkGrey14Bold,
                    ),
                    Text(
                      subtitle,
                      style: AppTextStyle.darkgrey13,
                    )
                  ],
                ),
                const Spacer(),
                 trailling?? const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: AppColors.dark14,
                ),
                const SizedBox(
                  width: 15,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
