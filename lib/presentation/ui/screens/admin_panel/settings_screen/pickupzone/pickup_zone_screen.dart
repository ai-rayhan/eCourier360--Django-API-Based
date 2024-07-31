import 'package:e_courier_360/presentation/state_holders/pickup_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/settings_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/settings_screen/branches/edit_branch_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
import 'package:e_courier_360/presentation/ui/widgets/settings/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickUpZoneScreen extends StatefulWidget {
  const PickUpZoneScreen({super.key});

  @override
  State<PickUpZoneScreen> createState() => _PickUpZoneScreenState();
}

class _PickUpZoneScreenState extends State<PickUpZoneScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<PickUpZoneController>().getPickupZone();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: const CourierAppBar(
      title: "Branches",
      ),
      body:GetBuilder<PickUpZoneController>(
        builder: (controller) {
          return Visibility(
            visible: !controller.inProgress,
            replacement: const Center(child: const CenterCircularProgressIndicator(),),
            child: ListView.builder(
              itemCount: controller.pickupZones.length,
              itemBuilder: (context,index)=>SettingsCard(title: controller.pickupZones[index].name,
             subtitle: controller.pickupZones[index].branchId.toString(), iconData: Icons.delivery_dining_outlined, ontap: (){
              Get.to(const PickUpZoneScreen());
             }))
          );
        }
      ),
           
           bottomNavigationBar: Padding(
             padding: const EdgeInsets.all(8.0),
             child: ElevatedButton(onPressed: (){
             Get.to(EditBranchScreen());
             }, child: const Text("Add Branch")),
           ),

            );
  }
}