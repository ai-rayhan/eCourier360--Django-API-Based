import 'package:e_courier_360/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:e_courier_360/presentation/utility/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//This is Base bottom Navigation Bar which used for all panel
class BaseBottomNavScreen extends StatelessWidget {
  const BaseBottomNavScreen({super.key, required this.screens, required this.items});
  final List<Widget> screens;
  final List<BottomNavigationBarItem> items;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (controller) {
      return Scaffold(
        body: PopScope(
        canPop: false, 
        onPopInvoked: (didPop) {
          if(controller.currentIndex==0){
          onExitDialog(context);
            return;
          }
           controller.backToHome();
        } ,
        child: screens[controller.currentIndex] ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: controller.changeIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: items
            ),
      );
    });
  }
}