import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/merchant/credential_form.dart';
import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:e_courier_360/routes/app_routes.dart';
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
  final TextEditingController _fullNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _shopNameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _shopAddressTEController =TextEditingController();
  final TextEditingController _pickupAddressTEController =TextEditingController();
  final TextEditingController _passwordTEController =TextEditingController();
  final TextEditingController _confirmPasswordTEController =TextEditingController();

  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                  MerchantForm(fullNameController: _fullNameTEController, emailController: _emailTEController, shopNameController: _shopNameTEController, pickPhoneController: _phoneTEController, shopAddressController: _shopAddressTEController, pickupAddressController: _pickupAddressTEController),
                  if(widget.role=="Rider")
                  RiderForm(fullNameController: _fullNameTEController, emailController: _emailTEController, phoneController: _phoneTEController, addressController: _shopAddressTEController, vehicleTypeController: _shopNameTEController, registrationNumberController: _pickupAddressTEController),
                  CredentialForm(passwordController: _passwordTEController, confimPasswordController: _confirmPasswordTEController),
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
                             bool response=false ;
                            if(widget.role=="Merchant"){
                              Map<String,dynamic> merchantInfo={
                                     "shop_name":_shopNameTEController.text,
                                     "pickup_phone": _phoneTEController.text,
                                     "shop_address": _shopAddressTEController.text,
                                     "pickup_address": _pickupAddressTEController.text,
                              };
                             response = await authController.signUp(
                                      _fullNameTEController.text,
                                      _emailTEController.text, 
                                      _phoneTEController.text, 
                                     _confirmPasswordTEController.text,"merchant",merchantInfo
                                        );
                            }else{
                              Map<String,dynamic> riderInfo={
                                     "full_name": _fullNameTEController.text,
                                     "email": _emailTEController.text,
                                     "phone": _phoneTEController.text,
                                     "address": _shopAddressTEController.text,
                                     "vehicle_type":  _shopNameTEController.text,
                                     "registration_number": _pickupAddressTEController.text,
                              };
                    
                              response = await authController.signUp(
                                 _fullNameTEController.text, 
                                 _emailTEController.text, 
                                  _phoneTEController.text, 
                                  _confirmPasswordTEController.text,"rider",
                                  riderInfo);
                            }
                    
                            if (response) {
                              Get.offAllNamed(RoutePath.verifyOtp,arguments: {'phone': _phoneTEController.text});
                            } else {
                              if (mounted) {
                                Get.snackbar('Wrong!',
                                    'Apply failed. ${authController.errorMessage}');
                              }
                            }
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
                       Text(
                        "Have an account?",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[600]),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        style:  TextButton.styleFrom(
                        backgroundColor: AppColors.white70,foregroundColor:AppColors.dark26 ,
                      ),
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
    _emailTEController.dispose();
    _fullNameTEController.dispose();
    _phoneTEController.dispose();
    _pickupAddressTEController.dispose();
    _shopNameTEController.dispose();
    _shopAddressTEController.dispose();
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}

