
import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/bottom_navigation_bar/admin_bottom_navigation_bar.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/auth/login_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/merchant_panel/bottom_navigationbar/merchant_bottom_navbar.dart';
import 'package:e_courier_360/presentation/ui/screens/rider_panel/bottom_navigationbar/rider_bottom_navbar.dart';

Widget goPanelHomeScreen(){
  if(AuthController.userRole=="Superadmin"){
  return const AdminBottomNavigationBar();
  }
  else if(AuthController.userRole=="Merchent"){
  return const MerchantBottomNavigationBar();
  }
  else if(AuthController.userRole=="Rider"){
  return const RiderBottomNavigationBar();
  }
  else{
    return const LoginScreen();
  }
}