import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/state_holders/otp_time_decrease_controller.dart';
import 'package:e_courier_360/presentation/state_holders/send_phone_otp_controller.dart';
import 'package:e_courier_360/presentation/state_holders/verify_otp_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/auth/login_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/app_logo.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key, required this.phone});

  final String phone;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final SendPhoneOtpController _sendPhoneOtpController=Get.find<SendPhoneOtpController>();
  final OtpTimeDecreaseController _otpTimeDecreaseController=Get.find<OtpTimeDecreaseController>();

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
   _sendPhoneOtpController.sendOtpToPhone(widget.phone);
   _otpTimeDecreaseController.startCountdown();
  }

  @override
  void dispose() {
    _otpTimeDecreaseController.timer.cancel(); // Dispose timer to prevent memory leaks
    super.dispose();
  }

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
                  height: 120,
                ),
                const AppLogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  'A 6 digit OTP code has been sent',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                PinCodeTextField(
                  controller: _otpTEController,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.transparent,
                    inactiveFillColor: Colors.transparent,
                    inactiveColor: AppColors.primaryColor,
                    selectedFillColor: Colors.transparent,
                    selectedColor: Colors.purple,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  width: double.infinity,
                  child:
                   GetBuilder<VerifyOTPController>(
                      builder: (verifyOTPController) {
                    return Visibility(
                      visible: verifyOTPController.inProgress == false,
                      replacement: const Center(child: CircularProgressIndicator()),
                      child: 
                      ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            final bool response = await verifyOTPController
                                .verifyOTP(widget.phone, _otpTEController.text);
                            if (response) {
                               await Get.find<AuthController>().saveVerification(true);
                                Get.to(() => const LoginScreen());
                            } else {
                              Get.showSnackbar(
                                GetSnackBar(
                                  title: 'OTP verification failed',
                                  message: verifyOTPController.errorMessage,
                                  duration: const Duration(seconds: 4),
                                  isDismissible: true,
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('Next'),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<OtpTimeDecreaseController>(
                  builder: (timeDecreaseController) {
                    return RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          const TextSpan(
                            text: 'This code will expire',
                          ),
                          TextSpan(
                            text: ' ${timeDecreaseController.countdown }s',
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                ),
                GetBuilder<OtpTimeDecreaseController>(
                  builder: (timeDecreaseController) {
                    return TextButton(
                      onPressed: timeDecreaseController.buttonEnabled
                          ? () {
                             startCountdown();
                              timeDecreaseController.countStart();
                            }
                          : null,
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                          color: timeDecreaseController.buttonEnabled ? Colors.blue : Colors.grey,
                        ),
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
