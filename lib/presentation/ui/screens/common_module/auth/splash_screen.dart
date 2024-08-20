import 'package:e_courier_360/core/constants/strings.dart';
import 'package:e_courier_360/data/helper/initial_route.dart';
import 'package:e_courier_360/data/utility/assets_path.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/state_holders/local/onboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    moveToNextScreen();

  }

  void moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    await Get.find<AuthController>().initialize();
    await Get.find<OnBoardingController>().checkSeeOnboard();
    InitialRoute.checkInitialRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Lottie.asset(AssetsPath.splashGif),
            ),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
             Text(AppStrings.appVersion,
              style: Theme.of(context).textTheme.bodyMedium
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
