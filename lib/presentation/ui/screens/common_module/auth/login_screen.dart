import 'package:e_courier_360/data/helper/route_panel_checker.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/splash/signup_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/center_outlined_button.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:e_courier_360/quick_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/logo_with_name.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword=true;
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
                  AppSizedBox.h16,
                  AppSizedBox.h5,
                  Text(
                    'Get Started with',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  CustomInputField(
                    controller: _emailTEController,
                    keyboardType:TextInputType.emailAddress,
                    hintText: 'Email',
                    icon: const Icon(Icons.email),
                  ),
                  AppSizedBox.h5,
                  CustomInputField(
                    controller: _passwordTEController,
                    keyboardType:TextInputType.visiblePassword,
                    suffixIcon: IconButton(onPressed: (){
                      showPassword=!showPassword;
                      setState(() {
                        
                      });
                    }, icon: Icon(showPassword?Icons.visibility:Icons.visibility_off)),
                    obscureText: showPassword,
                    hintText: 'Password',
                    icon: const Icon(Icons.lock),
                  ),
                  AppSizedBox.h10,
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
                            final bool response = await authController.logIn(
                                _emailTEController.text.trim(),
                                _passwordTEController.text);
                            if (response) {
                              if (mounted) {
                                checkUserPanel();
                              }
                            } else {
                              if (mounted) {
                                Get.snackbar(
                                    'Wrong!', 'Login failed. Try again');
                              }
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Log In',
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
                  AppSizedBox.h16,
                  Center(
                    child: TextButton(
                      onPressed: () {
                      Get.snackbar("Contact", "Contact Support:${QuickConfig.supportEmail}");
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[100]
                      ),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[400], fontSize: 16),
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  CenterMediumOutlinedbutton(
                      labelText: "Apply As a Rider",
                      icon: const Icon(Icons.card_travel),
                      onPressed: () {
                        Get.to(const SignupScreen(
                          role: 'Rider',
                        ));
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  CenterMediumOutlinedbutton(
                      labelText: "Apply As a Merchant",
                      icon: const Icon(Icons.apartment_rounded),
                      onPressed: () {
                        Get.to(const SignupScreen(
                          role: 'Merchant',
                        ));
                      }),
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
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}


