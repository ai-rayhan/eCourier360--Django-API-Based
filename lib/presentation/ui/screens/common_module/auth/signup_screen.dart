import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/auth/application_submitted_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/logo_with_name.dart';
import 'package:e_courier_360/presentation/ui/widgets/merchant/merchant_form.dart';
import 'package:e_courier_360/presentation/ui/widgets/rider/rider_form.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key, required this.role});
  final String role;
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const LogoWithName(),
                  Text(
                    "${widget.role } Sign Up:",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if(widget.role=="Merchant")
                  MerchantForm(userNameController: _userNameTEController, fullNameController: _fullNameTEController, shopEmailController: _shopEmailTEController, shopNameController: _shopNameTEController, pickPhoneController: _pickPhoneTEController, shopAddressController: _shopAddressTEController, pickupAddressController: _pickupAddressTEController),
                  if(widget.role=="Rider")
                  RiderForm(userNameController: _userNameTEController, fullNameController: _fullNameTEController, emailController: _shopEmailTEController, phoneController: _pickPhoneTEController, addressController: _shopAddressTEController, vehicleTypeController: _shopNameTEController, registrationNumberController: _pickupAddressTEController),
                 const SizedBox(
                    height: 16,
                  ),
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
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            //  bool response=false ;
                            // if(widget.role=="Merchant"){
                            //  response = await authController.merchantRegister(
                            //         username: _userNameTEController.text,
                            //         fullName: _fullNameTEController.text,
                            //         shopName: _shopNameTEController.text,
                            //         shopEmail: _shopEmailTEController.text,
                            //         shopAddress: _shopAddressTEController.text,
                            //         pickupPhone: _pickPhoneTEController.text,
                            //         pickupAddress:
                            //             _pickupAddressTEController.text);
                            // }else{
                            //   response = await authController.riderRegister(
                            //         username: _userNameTEController.text,
                            //         fullName: _fullNameTEController.text,
                            //         vehicleType: _shopNameTEController.text,
                            //         email: _shopEmailTEController.text,
                            //         address: _shopAddressTEController.text,
                            //         phone: _pickPhoneTEController.text,
                            //         registrationNo:
                            //             _pickupAddressTEController.text);
                            // }

                            // if (response) {
                            //   Get.to(const ApplicationSubmittedScreen());
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
                                'Apply Now',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account?",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
              ],),
              ]
            ),
          ),
        ),
      ),
    ));
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

