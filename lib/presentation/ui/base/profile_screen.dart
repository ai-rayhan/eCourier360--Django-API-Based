import 'package:e_courier_360/presentation/ui/widgets/profile/profile_card.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/auth/splash_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/app_logo.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';
import 'package:e_courier_360/quick_config.dart';

class ProfileScreen extends StatelessWidget {
  final Widget child;
  const ProfileScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CourierAppBar(
            title: "Profile",
            leadingOnPressed: () =>
                Get.find<MainBottomNavController>().backToHome()),
        body: Stack(
          children: [
            Container(
              color: AppColors.primaryColor,
              height: 170,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                  child: Column(children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                    decoration: AppBoxDecoration.whiteDecoration,
                    child: Column(
                      children: [
                        //Company Information
                        Container(
                          width: double.infinity,
                          decoration: AppBoxDecoration.whiteDecoration,
                          child: Column(
                            children: [
                              AppSizedBox.h16,
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: AppLogo(
                                    height: 100,
                                    width: 200,
                                  ),
                                ),
                              Text(
                                QuickConfig.appName,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(QuickConfig.slogan,
                                  style: Theme.of(context).textTheme.bodyLarge),
                              AppSizedBox.h8,
                            ],
                          ),
                        ),
                        // User profile
                        child,
                        ProfileCard(
                            title: "Logout",
                            subtitle: "Exit from app",
                            iconData: Icons.logout,
                            ontap: () {
                              Get.find<MainBottomNavController>().changeIndex(0);
                              AuthController.clearAuthData();
                              Get.offAll(const SplashScreen());
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
              ])),
            ),
          ],
        ));
  }
}
