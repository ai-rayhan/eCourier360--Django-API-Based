import 'package:e_courier_360/presentation/state_holders/delivery_type_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/settings_screen/delivery_type/edit_delivery_type_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_list_tile.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/empty_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryTypesScreen extends StatefulWidget {
  const DeliveryTypesScreen({super.key});

  @override
  State<DeliveryTypesScreen> createState() => _DeliveryTypesScreenState();
}

class _DeliveryTypesScreenState extends State<DeliveryTypesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<DeliveryTypeInfoController>().getDeliveryTypeInfo();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CourierAppBar(
        title: "Delivery Types",
      ),
      body: GetBuilder<DeliveryTypeInfoController>(builder: (controller) {
        return Visibility(
            visible: controller.deliveryTypes.isNotEmpty,
            replacement: const EmptyDataPage(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: controller.deliveryTypes.length,
                  itemBuilder: (context, index) => CustomListTile(
                        title: controller.deliveryTypes[index].deliveryType,
                        subtitle: controller.deliveryTypes[index].timeSlot ?? "",
                        leading: const Icon(Icons.view_in_ar_rounded),
                        onTap: () {
                          Get.to(EditDeliveryTypeScreen(
                            deliveryInfo: controller.deliveryTypes[index],
                          ));
                        },
                      )),
            ));
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {
              Get.to(const EditDeliveryTypeScreen());
            },
            child: const Text("Add Delivery Type")),
      ),
    );
  }
}
