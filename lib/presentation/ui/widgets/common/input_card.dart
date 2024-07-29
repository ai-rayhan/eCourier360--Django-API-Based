
import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  const InputCard({
    super.key, required this.child,
  });
final Widget child ;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 2,
          left: 12,
          right: 12,
          bottom: 2,
        ),
        decoration: ShapeDecoration(
          color: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
        ),
        child: child);
  }
}