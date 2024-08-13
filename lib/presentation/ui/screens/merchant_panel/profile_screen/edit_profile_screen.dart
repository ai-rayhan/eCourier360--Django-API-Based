
import 'dart:developer';

import 'package:e_courier_360/presentation/state_holders/merchant_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';
import 'package:e_courier_360/presentation/utility/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final MerchantController _profileController =
      Get.find<MerchantController>();


  String? 
      shopName,
      pickupPhone,
      pickupAddress,
      shopAddress;

  final _formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Edit Bussiness Profile",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
        ),
        body: GetBuilder<MerchantController>(
            builder: (mcProfileController) {
          return Visibility(
            visible: !mcProfileController.inProgress,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ListView(
              padding: const EdgeInsets.all(14),
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[

                      CustomInputField(
                        initialValue:
                            _profileController.merchantDetails?.shopName,
                        hintText: "Shop Name",
                        headerText: "Shop Name",
                        onSavedForm: (val) => shopName=val,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomInputField(
                        initialValue:
                            _profileController.merchantDetails?.shopAddress,
                        hintText: "Bussiness Address",
                        headerText: "Bussiness Address",
                        onSavedForm: (val) => shopAddress=val,
                      ),
                    
                      CustomInputField(
                        initialValue:
                            _profileController.merchantDetails?.pickupAddress,
                        hintText: "Pickup Address",
                        headerText: "Pickup Address",
                        onSavedForm: (val) => pickupAddress=val,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomInputField(
                        initialValue:
                            _profileController.merchantDetails?.pickupPhone,
                        hintText: "Pickup Phone",
                        headerText: "Pickup Phone",
                        onSavedForm: (val) => pickupPhone=val,
                      ),
                       AppSizedBox.h16,
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _formKey.currentState!.validate();
                            _formKey.currentState!.save();
                            log(pickupAddress.toString());
                            _profileController.updateProfile(shopName!,shopAddress!,pickupAddress!,pickupPhone!);
                             
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Update',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.update),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}

class Header2Text extends StatelessWidget {
  const Header2Text({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text(title,
              style: TextStyle(
                  fontFamily: FontFamily.popins,
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}