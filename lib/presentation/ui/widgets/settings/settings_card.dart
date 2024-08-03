import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';

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
                 trailling?? const Icon(
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

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
                 
      Column(
        children: [
          Container(
            width: 120,
            height: 25,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 219, 191, 255),
              borderRadius: BorderRadius.all(Radius.circular(8))),
            child: const Center(child: Text("Pickup Zone")),
          ),
          AppSizedBox.h5,
          Container(
            width:120,
            height: 25,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 214, 210, 255),
              borderRadius: BorderRadius.all(Radius.circular(8))),
            child: const Center(child: Text("Delivery Zone")),
          ),
        ],
      ),AppSizedBox.w10,
           Container(
        width: 40,
        height: 50,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 200, 186, 252),
          borderRadius: BorderRadius.all(Radius.circular(8))),
        child: const Center(child: Column(
          children: [
            Icon(Icons.edit_note_outlined),
            Text("Edit"),
          ],
        )),
      ),
      
    ],);
  }
}
