import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconData,
    required this.ontap,
    this.hasDivider,
  });
  final String title;
  final String subtitle;
  final IconData iconData;
  final VoidCallback ontap;
  final bool? hasDivider;
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
                Icon(
                  iconData,
                  color: AppColors.darkGreyColor,
                  size: 30,
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
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: AppColors.darkGreyColor,
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
