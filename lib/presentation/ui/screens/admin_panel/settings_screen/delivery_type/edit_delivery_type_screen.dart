import 'package:e_courier_360/data/models/delivery_type_info.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';
import 'package:flutter/material.dart';

class EditDeliveryTypeScreen extends StatefulWidget {
  const EditDeliveryTypeScreen({super.key, this.deliveryInfo});
  final DeliveryInfo? deliveryInfo;

  @override
  State<EditDeliveryTypeScreen> createState() => _EditDeliveryTypeScreenState();
}

class _EditDeliveryTypeScreenState extends State<EditDeliveryTypeScreen> {
  late TextEditingController _deliveryTypeController;
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
    _deliveryTypeController = TextEditingController(text: widget.deliveryInfo?.deliveryType ?? '');
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
    _deliveryTypeController.dispose();
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
            controller: _deliveryTypeController,
            hintText: 'Name',
            icon: const Icon(Icons.account_circle_sharp),
          ),
          AppSizedBox.h8,
          CustomInputField(
            controller: _timeSlotController,
            hintText: 'Phone',
            icon: const Icon(Icons.near_me_rounded),
          ),
          AppSizedBox.h8,

          Row(
            children: [
               Expanded(
                child: CustomInputField(
                  controller: _estimatedDaysController,
                  hintText: 'Email',
                  icon: const Icon(Icons.near_me_rounded),
                ),
              ),
              AppSizedBox.w5,
              Expanded(
                child: CustomInputField(
                  controller: _basicChargeController,
                  hintText: 'Email',
                  icon: const Icon(Icons.near_me_rounded),
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
                  hintText: 'Email',
                  icon: const Icon(Icons.near_me_rounded),
                ),
              ),
              AppSizedBox.w5,
              Expanded(
                child: CustomInputField(
                  controller: _perWidthController,
                  hintText: 'Email',
                  icon: const Icon(Icons.near_me_rounded),
                ),
              ),
            ],
          ),
          AppSizedBox.h8,
           Row(
            children: [
               Expanded(
                child: CustomInputField(
                  controller: _perWidthController,
                  hintText: 'Email',
                  icon: const Icon(Icons.near_me_rounded),
                ),
              ),
              AppSizedBox.w5,
              Expanded(
                child: CustomInputField(
                  controller: _cashCollectionChargeController,
                  hintText: 'Email',
                  icon: const Icon(Icons.near_me_rounded),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: ElevatedButton(onPressed: (){
                if(widget.deliveryInfo!=null){
                  // Get.find<SettingsController>().updateBranch(_nameTEController.text, _phoneTEController.text, _emailTEController.text, _addressTEController.text,widget.branch!.id);
                }else{
                //  Get.find<SettingsController>().addBranch(_nameTEController.text, _phoneTEController.text, _emailTEController.text, _addressTEController.text);
                }
               
               }, child:  Text(widget.deliveryInfo==null? "Add Delivery type":"Update Delivery type")),
             ),
          ),
        ],),
      ),
      );
  }
}