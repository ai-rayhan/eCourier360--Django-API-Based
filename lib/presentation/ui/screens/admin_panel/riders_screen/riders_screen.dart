import 'package:e_courier_360/presentation/ui/screens/admin_panel/riders_screen/riders_list_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:flutter/material.dart';
class RidersScreen extends StatefulWidget {
  const RidersScreen({super.key});

  @override
  RidersScreenState createState() => RidersScreenState();
}

class RidersScreenState extends State<RidersScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CourierAppBar(title: "Riders",),
      body: Center(child: RiderList()
        )
    );
  }
}
