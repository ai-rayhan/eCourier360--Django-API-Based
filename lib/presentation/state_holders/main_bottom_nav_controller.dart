import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/admin_home_screen/admin_home_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/merchants_screen/merchants_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/settings_screen/settings_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/auth/login_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/parcels/parcels_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/guest_panel/home/home_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/merchant_panel/calculate_screen/calculate_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/merchant_panel/profile_screen/profile_screen.dart';
import 'package:e_courier_360/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int _selectedIndex = 0;

  int get currentIndex => _selectedIndex;

  // void changeIndex(int index) {
  //   if (_selectedIndex == index) {
  //     return;
  //   }
  //   if (index == 2 || index == 3) {
  //     if (Get.find<AuthController>().isTokenNotNull == false) {
  //       Get.to(RoutePath.login);
  //       return;
  //     }
  //   }
  //   _selectedIndex = index;
  //   update();
  // }

 
  void backToHome() {
    changePage(0);
  }
  

 List<String> get pages{
    if(AuthController.userRole==1||AuthController.userRole==2){
      final pages = <String>[RoutePath.adminHome,RoutePath.merchants, RoutePath.parcels,RoutePath.settings];
      return pages;
    }
    else if(AuthController.userRole==3){
      final pages = <String>[RoutePath.merchantHome,RoutePath.calculateCost, RoutePath.parcels,RoutePath.merchantsettings];
      return pages;
    }else if(AuthController.userRole==4){
      final pages = <String>[RoutePath.merchantHome, RoutePath.parcels,RoutePath.merchantsettings];
      return pages;
    }else{
      final pages = <String>[RoutePath.guestHome,RoutePath.calculateCost, RoutePath.parcels,RoutePath.guestProfile];
      return pages;
    }
  }
  
  void changePage(int index) {
    _selectedIndex = index;
    update();
    Get.offNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == RoutePath.adminHome) {
      return GetPageRoute(
        settings: settings,
        page: () => AdminHomeScreen(),
        // binding: BrowseBinding(),
      );
    }

    if (settings.name == RoutePath.merchants) {
      return GetPageRoute(
        settings: settings,
        page: () => MerchantsScreen(),
        // binding: HistoryBinding(),
      );
    }

    if (settings.name ==RoutePath.parcels) {
      return GetPageRoute(
        settings: settings,
        page: () => ParcelsTrackScreen(),
        // binding: SettingsBinding(),
      );
    }
    if (settings.name == RoutePath.settings) {
      return GetPageRoute(
        settings: settings,
        page: () => AdminSettingsScreen(),
        // binding: SettingsBinding(),
      );
    }  

    //Merchant panel
    if (settings.name == RoutePath.merchantHome) {
      return GetPageRoute(
        settings: settings,
        page: () => GuestHomeScreen(),
        // binding: SettingsBinding(),
      );
    }
    if (settings.name == RoutePath.calculateCost) {
      return GetPageRoute(
        settings: settings,
        page: () => CalculateScreen(),
        // binding: SettingsBinding(),
      );
    }

    if (settings.name == RoutePath.merchantsettings) {
      return GetPageRoute(
        settings: settings,
        page: () => MerchantProfileScreen(),
        // binding: SettingsBinding(),
      );
    }
    
    //Guest panel
    if (settings.name == RoutePath.guestHome) {
      return GetPageRoute(
        settings: settings,
        page: () => GuestHomeScreen(),
        // binding: SettingsBinding(),
      );
    }
    if (settings.name == RoutePath.guestProfile) {
      return GetPageRoute(
        settings: settings,
        page: () => LoginScreen(),
        // binding: SettingsBinding(),
      );
    }

    return null;
  }
}
