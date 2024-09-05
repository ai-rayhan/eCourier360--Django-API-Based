import 'package:e_courier_360/presentation/ui/base/base_bottom_navigationbar.dart';
import 'package:e_courier_360/routes/app_routes.dart';
import 'package:flutter/material.dart';


class GuestBottomNavigationBar extends StatefulWidget {
  const GuestBottomNavigationBar({super.key});

  @override
  State<GuestBottomNavigationBar> createState() =>
      _GuestBottomNavigationBarState();
}

class _GuestBottomNavigationBarState
    extends State<GuestBottomNavigationBar> {


  @override
  Widget build(BuildContext context) {
    return const BaseBottomNavScreen(initialRoute:RoutePath.merchantHome, items: [
      BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Calculate'),
      BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Parcels'),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), label: 'Profile'),
    ]);
  }
}
