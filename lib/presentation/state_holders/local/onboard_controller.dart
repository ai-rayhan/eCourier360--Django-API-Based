

import 'package:e_courier_360/presentation/ui/screens/common_module/auth/login_screen.dart';
import 'package:e_courier_360/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingController extends GetxController {
  final PageController pageController = PageController();

  int  selectedIndex = 0;
  bool isSeeOnboard=false;

  Future<void> saveSeeOnboard() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('seeOnboard',true);
  }
  Future<void> checkSeeOnboard() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isSeeOnboard= sharedPreferences.getBool('seeOnboard')??false;
  }
updateIndex(int index){
selectedIndex=index;
update();
}

  Future<void> makeSeeOnboard() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('seeOnboard', true);
  }
  Future<void> switchGuestMode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('guestmode', true);
  }

  void navigateToLogin() {
    makeSeeOnboard();
    Get.offAll(const LoginScreen());
  }
  void navigateToAsGuest() {
    switchGuestMode();
    Get.offNamed(RoutePath.guestBottomNav);
  }
}