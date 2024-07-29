
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';


  class ParcelViewText extends StatelessWidget {
  const ParcelViewText({super.key,required this.prefix, required this.text, this.style});
  final String prefix;
  final String text;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      Expanded(child: Text(prefix, style: AppTextStyle.primary14w600)),
      Expanded(child: Text(text,style:style ??  AppTextStyle.darkGrey13Bold.copyWith(color: AppColors.secondaryColor))),
      ],);
  }
}