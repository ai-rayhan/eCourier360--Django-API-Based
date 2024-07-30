import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/settings/settings_card.dart';
import 'package:flutter/material.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: CourierAppBar(
      title: "Branches",
      ),
      body:SingleChildScrollView(child: Column(children: [ 
          SettingsCard(
            title: "Branches and Zones",
            subtitle: "Branches, Pickup Zones and Delivery Zones",
            iconData: Icons.grass,
            ontap: () {}),
          SettingsCard(
            title: "Branches",
            subtitle: "add and view all branch",
            iconData: Icons.grass,
            ontap: () {}),
            ],),),
           
           bottomNavigationBar: Padding(
             padding: const EdgeInsets.all(8.0),
             child: ElevatedButton(onPressed: (){}, child: Text("Add Branch")),
           ),

            );
  }
}