import 'package:e_courier_360/presentation/ui/base/base_home_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/home/support_card.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';

class RiderHomeScreen extends StatelessWidget {
  const RiderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseHomeScreen(bottomChild: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       AppSizedBox.h10,
       Text('Let\'s do ',style: TextStyle(fontFamily: FontFamily.popins,fontSize: 18,fontWeight: FontWeight.w500)),
         AppSizedBox.h10,
            const SizedBox(height: 15),
            const SupportCard(),
    ],));
  }
}
