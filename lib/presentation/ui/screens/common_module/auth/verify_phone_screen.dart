import 'package:e_courier_360/presentation/state_holders/send_phone_otp_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/app_logo.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/input_card.dart';
import 'package:e_courier_360/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyPhoneScreen extends StatefulWidget {
  const VerifyPhoneScreen({super.key});

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  final TextEditingController _phoneTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final bool? args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 160,
                ),
                const AppLogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  'Welcome back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  'Please enter your Phone Number',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                InputCard(
                  child: TextFormField(
                    controller: _phoneTEController,
                    decoration: (const InputDecoration(hintText: 'Phone Number')),
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your Phone Number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                GetBuilder<SendPhoneOtpController>(builder: (controller) {
                  return SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: controller.inProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child:
                         Padding(
                           padding: const EdgeInsets.all(16.0),
                           child: SizedBox(
                            width: double.infinity,
                             child: ElevatedButton(
                                onPressed: () async {
                                  if (_formkey.currentState!.validate()) {
                                    final bool result =
                                        await controller.sendOtpToPhone(
                                            _phoneTEController.text.trim());
                                    if (result) {
                                      if(args==true){
                                       Get.toNamed(RoutePath.verifyOtp,arguments:{'phone':_phoneTEController.text});
                                      }else{
                                      //  Get.toNamed(RoutePath.verifyOtpAndUpdatePassword,arguments:{'phone':_phoneTEController.text});
                                      }
                                    } else {
                                      Get.showSnackbar(
                                        GetSnackBar(
                                          title: 'Send OTP failed',
                                          message: controller.errorMessage,
                                          duration: const Duration(seconds: 2),
                                          isDismissible: true,
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: const Text('Next')),
                           ),
                         ),
                      ));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
