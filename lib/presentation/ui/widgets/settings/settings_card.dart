
import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconData,
    required this.ontap,
    this.trailing,
    this.hasDivider = false,
  });

  final String title;
  final String subtitle;
  final IconData iconData;
  final VoidCallback ontap;
  final Widget? trailing;
  final bool hasDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (hasDivider)
          Divider(
            height: 1,
            color: Colors.grey[300],
          ),
        ListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          onTap: ontap,
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
            child: Icon(
              iconData,
              color: AppColors.lightPrimaryColor,
              size: 24,
            ),
          ),
          title: Text(
            title,
            // style: const TextStyle(
            //   fontWeight: FontWeight.w500,
            //   fontSize: 16,
            // ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 13,
            ),
          ),
          trailing: trailing ??
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.grey,
              ),
        ),
      ],
    );
  }
}
