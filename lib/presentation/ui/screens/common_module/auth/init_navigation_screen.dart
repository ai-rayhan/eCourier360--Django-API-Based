// import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/local/onboard_controller.dart';
// import 'package:e_courier_360/presentation/ui/screens/common_module/auth/login_screen.dart';
// import 'package:e_courier_360/presentation/ui/screens/common_module/onboard_screen/onboard_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:e_courier_360/home_route.dart';

// class InitNavigationDecisionScreen extends StatefulWidget {
//   const InitNavigationDecisionScreen({super.key});

//   @override
//   State<InitNavigationDecisionScreen> createState() => _InitNavigationDecisionScreenState();
// }

// class _InitNavigationDecisionScreenState extends State<InitNavigationDecisionScreen> {
//   final OnBoardingController _onboardController = Get.find<OnBoardingController>(); 
//   final AuthController _authController = Get.find<AuthController>(); 

//   @override
//   Widget build(BuildContext context) {
//     if (_authController.isTokenNotNull && _onboardController.isSeeOnboard) {
//       return goPanelHomeScreen(); //Panel wise home Navigation
//     } else if (!_authController.isTokenNotNull && _onboardController.isSeeOnboard) {
//       return const LoginScreen(); 
//     } else {
//       return const OnBoardingScreen();
//     }
//   }
// }
