import 'package:e_courier_360/data/models/branch.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_zone_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_dialog.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/ui/widgets/settings/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryZoneScreen extends StatefulWidget {
  final Branch branch;
  const DeliveryZoneScreen({super.key, required this.branch});

  @override
  State<DeliveryZoneScreen> createState() => _DeliveryZoneScreenState();
}

class _DeliveryZoneScreenState extends State<DeliveryZoneScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<DeliveryZoneController>().getDeliveryZone(branchId: widget.branch.id);
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }
  TextEditingController _nameTEController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:  CourierAppBar(
      title: "${widget.branch.name}>Delivery Zone",
      ),
      body:GetBuilder<DeliveryZoneController>(
        builder: (controller) {
          return Visibility(
            visible: !controller.inProgress,
            replacement: const Center(child:  CenterCircularProgressIndicator(),),
            child: ListView.builder(
              itemCount: controller.deliveryZones.length,
              itemBuilder: (context,index)=>SettingsCard(
              title: controller.deliveryZones[index].name,
             subtitle: controller.deliveryZones[index].branchId.toString(), iconData: Icons.local_shipping_rounded, ontap: (){
             },
             trailling: IconButton(icon: Icon(Icons.edit),onPressed: (){
              _nameTEController.text=controller.deliveryZones[index].name;
              showCustomDialog(context: context, title: "Update PickUp Zone",content:CustomInputField(hintText: 'Name',controller: _nameTEController,),
               onSubmitPressed: () async{
              await Get.find<DeliveryZoneController>().updateDeliveryZone(_nameTEController.text, widget.branch.id,controller.deliveryZones[index].id);
              _nameTEController.clear();
             },);
             },),
             ))

          );
        }
      ),
           
           bottomNavigationBar: Padding(
             padding: const EdgeInsets.all(8.0),
             child: ElevatedButton(onPressed: (){
             showCustomDialog(context: context, title: "Add PickUp Zone",content:CustomInputField(hintText: 'Name',controller: _nameTEController,),
             onSubmitPressed: () async{
              await Get.find<DeliveryZoneController>().addDeliveryZone(_nameTEController.text, widget.branch.id);
               _nameTEController.clear();
             },
             );
             }, child: const Text("Add Delivery Zone")),
           ),

            );
  }
    @override
  void dispose() {
  _nameTEController.dispose();
    super.dispose();
  }
}