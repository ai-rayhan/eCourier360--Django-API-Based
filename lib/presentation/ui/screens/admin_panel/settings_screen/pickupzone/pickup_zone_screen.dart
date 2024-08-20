import 'package:e_courier_360/data/models/branch.dart';
import 'package:e_courier_360/presentation/state_holders/pickup_zone_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_dialog.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickUpZoneScreen extends StatefulWidget {
  final Branch branch;
  const PickUpZoneScreen({super.key, required this.branch});

  @override
  State<PickUpZoneScreen> createState() => _PickUpZoneScreenState();
}

class _PickUpZoneScreenState extends State<PickUpZoneScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<PickUpZoneController>()
          .getPickupZone(branchId: widget.branch.id);
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  TextEditingController _nameTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CourierAppBar(
        title: "PickupZones",
      ),
      body: GetBuilder<PickUpZoneController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: controller.pickupZones.length,
              itemBuilder: (context, index) => CustomListTile(
                title: controller.pickupZones[index].name,
                subtitle: widget.branch.name,
                leading: CircleAvatar(radius: 20,child: Text(controller.pickupZones[index].id.toString()),),
                trailing: IconButton(
                icon: const Icon(Icons.edit),
                  onPressed: () {
                    _nameTEController.text =
                        controller.pickupZones[index].name;
                    showCustomDialog(
                      context: context,
                      title: "Update PickUp Zone",
                      content: CustomInputField(
                        hintText: 'Name',
                        controller: _nameTEController,
                      ),
                      onSubmitPressed: () async {
                        await Get.find<PickUpZoneController>()
                            .updatePickupZone(
                                _nameTEController.text,
                                widget.branch.id,
                                controller.pickupZones[index].id);
                        _nameTEController.clear();
                      },
                    );
                  },
                ),
              )),
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {
              showCustomDialog(
                context: context,
                title: "Add PickUp Zone",
                content: CustomInputField(
                  hintText: 'Name',
                  controller: _nameTEController,
                ),
                onSubmitPressed: () async {
                  await Get.find<PickUpZoneController>()
                      .addPickupZone(_nameTEController.text, widget.branch.id);
                  _nameTEController.clear();
                },
              );
            },
            child: const Text("Add PickUpZone")),
      ),
    );
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    super.dispose();
  }
}
