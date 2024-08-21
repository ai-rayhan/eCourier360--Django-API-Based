import 'package:e_courier_360/data/models/branch.dart';
import 'package:e_courier_360/presentation/state_holders/settings_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/settings_screen/branches/edit_branch_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/settings_screen/deliveryzone/delivery_zone_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/settings_screen/pickupzone/pickup_zone_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_list_tile.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/empty_data.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: controller.branches.length,
                  itemBuilder: (context, index) => CustomListTile(
                      title:controller.branches[index].name,
                      subtitle: controller.branches[index].address,
                      leading: CircleAvatar(child: const Icon(Icons.hub_outlined)),
                      trailing: BranchEditCard(
                        branch: controller.branches[index],
                      )
                      )),
            ));
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

class BranchEditCard extends StatelessWidget {
  const BranchEditCard({
    super.key,
    required this.branch,
  });
  final Branch branch;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Column(
          children: [],
        ),
        AppSizedBox.w10,
        GestureDetector(
          onTap: () {
            Get.to(PickUpZoneScreen(
              branch: branch,
            ));
          },
          child: Container(
            width: 60,
            height: 40,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 219, 209, 253),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child:  Center(
                child: Text(
              "Pickup\nZones",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color: const Color.fromARGB(255, 90, 90, 90)),
            )),
          ),
        ),
        AppSizedBox.w10,
        GestureDetector(
          onTap: () {
            Get.to(DeliveryZoneScreen(
              branch: branch,
            ));
          },
          child: Container(
            width: 60,
            height: 40,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 211, 199, 253),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: const Center(
                child: Text(
              "Delivery\nZones",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color:  Color.fromARGB(255, 90, 90, 90)),
            ))
          ),
        ),
        AppSizedBox.w10,
        GestureDetector(
          onTap: () {
            Get.to(EditBranchScreen(
              branch: branch,
            ));
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 200, 186, 252),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: const Center(
                child: Column(
              children: [
                Icon(
                  Icons.edit_note_outlined,color:  Color.fromARGB(255, 90, 90, 90),
                  size: 15,
                ),
                Text(
                  "Edit",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13,color:  Color.fromARGB(255, 90, 90, 90)),
                ),
              ],
            )),
          ),
        ),
      ],
    );
  }
}
