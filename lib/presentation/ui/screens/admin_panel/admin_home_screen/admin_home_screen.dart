import 'package:e_courier_360/presentation/ui/base/base_home_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/admin_home_screen/admin_options.dart';
import 'package:e_courier_360/presentation/utility/size.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';
class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseHomeScreen(
        bottomChild: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSizedBox.h10,
        Text('Administration',
            style: TextStyle(
                fontFamily: FontFamily.popins,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        AppSizedBox.h10,
        
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                // mainAxisExtent: Sizefinder.deviceWidth(context)/4,
              ),
              itemCount: adminOptions.length,
              itemBuilder: (BuildContext context, int index) {
                return adminOptions[index];
              },
            ),
          ),
        AppSizedBox.h16
      ],
    ));
  }
}
