import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/ui/widgets/merchant/merchant_form.dart';

class AddMerchantScreen extends StatefulWidget {
  const AddMerchantScreen({super.key,});

  @override
  State<AddMerchantScreen> createState() => _AddMerchantScreenState();
}

class _AddMerchantScreenState extends State<AddMerchantScreen> {
  final TextEditingController _userNameTEController = TextEditingController();
  final TextEditingController _fullNameTEController = TextEditingController();
  final TextEditingController _shopEmailTEController = TextEditingController();
  final TextEditingController _shopNameTEController = TextEditingController();
  final TextEditingController _pickPhoneTEController = TextEditingController();
  final TextEditingController _shopAddressTEController =
      TextEditingController();
  final TextEditingController _pickupAddressTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CourierAppBar(title: "Add Merchant",),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MerchantForm(
                    userNameController: _userNameTEController,
                    fullNameController: _fullNameTEController, 
                    shopEmailController: _shopEmailTEController, 
                    shopNameController: _shopNameTEController, 
                    pickPhoneController: _pickPhoneTEController, 
                    shopAddressController: _shopAddressTEController, 
                    pickupAddressController: _pickupAddressTEController),
                  SizedBox(
                    width: double.infinity,
                    child:
                        GetBuilder<AuthController>(builder: (authController) {
                      return Visibility(
                        visible: authController.inProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            // if (!_formKey.currentState!.validate()) {
                            //   return;
                            // }
                            // final bool response =
                            //     await authController.merchantRegister(
                            //         username: _userNameTEController.text,
                            //         fullName: _fullNameTEController.text,
                            //         shopName: _shopNameTEController.text,
                            //         shopEmail: _shopEmailTEController.text,
                            //         shopAddress: _shopAddressTEController.text,
                            //         pickupPhone: _pickPhoneTEController.text,
                            //         pickupAddress:
                            //             _pickupAddressTEController.text);
                            // if (response) {
                            //   if (mounted) {
                            //        Get.snackbar('Well Done!',
                            //         'Merchant Created.');
                            //       Get.back();
                            //       Get.off(const MerchantsScreen());}
                            // } else {
                            //   if (mounted) {
                            //     Get.snackbar('Wrong!',
                            //         'Apply failed. ${authController.errorMessage}');
                            //   }
                            // }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add Merchant',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.arrow_circle_right_outlined),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _shopEmailTEController.dispose();
    _userNameTEController.dispose();
    _fullNameTEController.dispose();
    _pickPhoneTEController.dispose();
    _pickupAddressTEController.dispose();
    _shopNameTEController.dispose();
    _shopAddressTEController.dispose();
    super.dispose();
  }
}
