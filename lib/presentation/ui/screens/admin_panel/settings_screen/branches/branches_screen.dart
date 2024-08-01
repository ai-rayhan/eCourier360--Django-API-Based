import 'package:e_courier_360/presentation/state_holders/settings_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/settings_screen/branches/edit_branch_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/settings_screen/deliveryzone/delivery_zone_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/empty_data.dart';
import 'package:e_courier_360/presentation/ui/widgets/settings/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BranchesScreen extends StatefulWidget {
  const BranchesScreen({super.key});

  @override
  State<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<SettingsController>().getBranches();
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
      body: GetBuilder<SettingsController>(builder: (controller) {
        return Visibility(
            visible: controller.branches.isNotEmpty,
            replacement: const EmptyDataPage(),
            child: ListView.builder(
                itemCount: controller.branches.length,
                itemBuilder: (context, index) => SettingsCard(
                      title: controller.branches[index].name,
                      subtitle: controller.branches[index].address,
                      iconData: Icons.grass,
                      ontap: () {
                        Get.to( DeliveryZoneScreen(branch: controller.branches[index],));
                      },
                      trailling:NewWidget()
                      //  IconButton(icon: Icon(Icons.edit),onPressed: (){
                      //   Get.to(EditBranchScreen(branch: controller.branches[index],));
                      // })
                    )));
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {
              Get.to(const EditBranchScreen());
            },
            child: const Text("Add Branch")),
      ),
    );
  }
}
