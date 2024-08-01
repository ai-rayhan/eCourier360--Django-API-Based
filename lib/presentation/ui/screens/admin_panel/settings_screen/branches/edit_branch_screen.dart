import 'package:e_courier_360/data/models/branch.dart';
import 'package:e_courier_360/presentation/state_holders/settings_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditBranchScreen extends StatefulWidget {
  const EditBranchScreen({super.key, this.branch});
  final Branch? branch;

  @override
  State<EditBranchScreen> createState() => _EditBranchScreenState();
}

class _EditBranchScreenState extends State<EditBranchScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  @override
  void initState() {
    _nameTEController.text = widget.branch?.name??'';
    _phoneTEController.text =widget.branch?.phone??'';
    _emailTEController.text =widget.branch?.email??'';
    _addressTEController.text=widget.branch?.address??'';
    super.initState();
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
            controller: _nameTEController,
            hintText: 'Name',
            icon: const Icon(Icons.account_circle_sharp),
          ),
          AppSizedBox.h8,
          CustomInputField(
            controller: _phoneTEController,
            hintText: 'Phone',
            icon: const Icon(Icons.near_me_rounded),
          ),
          AppSizedBox.h8,
          CustomInputField(
            controller: _emailTEController,
            hintText: 'Email',
            icon: const Icon(Icons.near_me_rounded),
          ),
          AppSizedBox.h8,
          CustomInputField(
            controller: _addressTEController,
            hintText: 'Address',
            icon: const Icon(Icons.near_me_rounded),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: ElevatedButton(onPressed: (){
                if(widget.branch!=null){
                  Get.find<SettingsController>().updateBranch(_nameTEController.text, _phoneTEController.text, _emailTEController.text, _addressTEController.text,widget.branch!.id);
                }else{
                 Get.find<SettingsController>().addBranch(_nameTEController.text, _phoneTEController.text, _emailTEController.text, _addressTEController.text);
                }
               
               }, child:  Text(widget.branch==null? "Add Branch":"Update Branch")),
             ),
          ),
        ],),
      ),
      );
  }
}