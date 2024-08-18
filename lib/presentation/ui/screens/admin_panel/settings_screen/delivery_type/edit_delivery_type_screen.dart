import 'package:e_courier_360/data/models/delivery_type_info.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_type_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDeliveryTypeScreen extends StatefulWidget {
  const EditDeliveryTypeScreen({super.key, this.deliveryInfo});
  final DeliveryInfo? deliveryInfo;

  @override
  State<EditDeliveryTypeScreen> createState() => _EditDeliveryTypeScreenState();
}

class _EditDeliveryTypeScreenState extends State<EditDeliveryTypeScreen> {
  late TextEditingController _deliveryTypeNameController;
  late TextEditingController _timeSlotController;
  late TextEditingController _estimatedDaysController;
  late TextEditingController _basicChargeController;
  late TextEditingController _perKgWeightController;
  late TextEditingController _perHeightController;
  late TextEditingController _perWidthController;
  late TextEditingController _cashCollectionChargeController;

  @override
  void initState() {
    super.initState();
    _deliveryTypeNameController = TextEditingController(text: widget.deliveryInfo?.deliveryType ?? '');
    _timeSlotController = TextEditingController(text: widget.deliveryInfo?.timeSlot ?? '');
    _estimatedDaysController = TextEditingController(text: widget.deliveryInfo?.estimatedDays ?? '');
    _basicChargeController = TextEditingController(text: widget.deliveryInfo?.basicCharge.toString() ?? '');
    _perKgWeightController = TextEditingController(text: widget.deliveryInfo?.perKgWeight.toString() ?? '');
    _perHeightController = TextEditingController(text: widget.deliveryInfo?.perHeight.toString() ?? '');
    _perWidthController = TextEditingController(text: widget.deliveryInfo?.perWidth.toString() ?? '');
    _cashCollectionChargeController = TextEditingController(text: widget.deliveryInfo?.cashCollectionChargePercent.toString() ?? '');
  }

  @override
  void dispose() {
    _deliveryTypeNameController.dispose();
    _timeSlotController.dispose();
    _estimatedDaysController.dispose();
    _basicChargeController.dispose();
    _perKgWeightController.dispose();
    _perHeightController.dispose();
    _perWidthController.dispose();
    _cashCollectionChargeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: const CourierAppBar(
      title: "Add/Update Branch",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          AppSizedBox.h8,
          CustomInputField(
            controller: _deliveryTypeNameController,
            hintText: 'Name',
            icon: const Icon(Icons.near_me),
          ),
          AppSizedBox.h8,
          CustomInputField(
            controller: _timeSlotController,
            hintText: 'Time Slot',
            icon: const Icon(Icons.timer_sharp),
          ),
          AppSizedBox.h8,

          Row(
            children: [
               Expanded(
                child: CustomInputField(
                  controller: _estimatedDaysController,
                  hintText: 'Estimated days',
                  icon: const Icon(Icons.date_range_rounded),
                ),
              ),
              AppSizedBox.w5,
              Expanded(
                child: CustomInputField(
                  controller: _basicChargeController,
                  hintText: 'Delivery Charge',
                  icon: const Icon(Icons.currency_exchange_rounded),
                ),
              ),
            ],
          ),
          AppSizedBox.h8,
           Row(
            children: [
               Expanded(
                child: CustomInputField(
                  controller: _perHeightController,
                  hintText: 'Per Inch Height Charge',
                  icon: const Icon(Icons.height),
                ),
              ),
              AppSizedBox.w5,
              Expanded(
                child: CustomInputField(
                  controller: _perWidthController,
                  hintText: 'Per Inch Width Charge',
                  icon: const Icon(Icons.width_normal),
                ),
              ),
            ],
          ),
          AppSizedBox.h8,
           Row(
            children: [
               Expanded(
                child: CustomInputField(
                  controller: _perKgWeightController,
                  hintText: 'Per KG Weight Charge',
                  icon: const Icon(Icons.line_weight),
                ),
              ),
              AppSizedBox.w5,
              Expanded(
                child: CustomInputField(
                  controller: _cashCollectionChargeController,
                  hintText: 'COD Charge (%)',
                  icon: const Icon(Icons.home),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: ElevatedButton(onPressed: (){
                 final deliveryInfo = DeliveryInfo( deliveryType: _deliveryTypeNameController.text, timeSlot: _timeSlotController.text, estimatedDays: _estimatedDaysController.text, basicCharge: double.tryParse(_basicChargeController.text) ?? 0.0, perKgWeight: double.tryParse(_perKgWeightController.text) ?? 0.0, perHeight: double.tryParse(_perHeightController.text) ?? 0.0, perWidth: double.tryParse(_perWidthController.text) ?? 0.0, cashCollectionChargePercent: double.tryParse(_cashCollectionChargeController.text) ?? 0.0, id: widget.deliveryInfo?.id,);
                if(widget.deliveryInfo==null){
                  Get.find<DeliveryTypeInfoController>().addDeliveryType(deliveryInfo);
                }else{
                 Get.find<DeliveryTypeInfoController>().updateDeliveryType(deliveryInfo,widget.deliveryInfo!.id!);
                }
               
               }, child:  Text(widget.deliveryInfo==null? "Add Delivery type":"Update Delivery type")),
             ),
          ),
        ],),
      ),
      );
  }
}