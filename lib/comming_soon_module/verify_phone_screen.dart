// import 'package:e_courier_360/presentation/ui/screens/common_module/auth/verify_otp_screen.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/app_logo.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:e_courier_360/presentation/utility/sizedbox.dart';

// class VerifyPhoneScreen extends StatefulWidget {
//   const VerifyPhoneScreen({super.key});

//   @override
//   State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
// }

// class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
//   final TextEditingController _phoneTEController = TextEditingController();
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Form(
//             key: _formkey,
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 160,
//                 ),
//                 const AppLogo(
//                   height: 80,
//                 ),
//                 const SizedBox(
//                   height: 24.0,
//                 ),
//                 Text(
//                   'Welcome back',
//                   style: Theme.of(context).textTheme.titleLarge,
//                 ),
//                 AppSizedBox.h5,
//                 Text(
//                   'Please enter your Phone Number',
//                   style: Theme.of(context).textTheme.bodySmall,
//                 ),
//                 AppSizedBox.h16,
//                 CustomInputField(controller: _phoneTEController, hintText: "Phone Number",icon: const Icon(Icons.phone),),
               
//                 AppSizedBox.h5,
//                 // GetBuilder<SendPhoneOtpController>(builder: (controller) {
//                 //   return SizedBox(
//                 //       width: double.infinity,
//                 //       child: Visibility(
//                 //         visible: controller.inProgress == false,
//                 //         replacement: const Center(
//                 //           child: CircularProgressIndicator(),
//                 //         ),
//                         // child:
//                          Padding(
//                            padding: const EdgeInsets.all(16.0),
//                            child: SizedBox(
//                             width: double.infinity,
//                              child: ElevatedButton(
//                                 onPressed: () async {
//                                     Get.to(() => VerifyOTPScreen(
//                                            phone:_phoneTEController.text.trim(),
//                                           ));
//                                   // if (_formkey.currentState!.validate()) {
//                                   //   final bool result =
//                                   //       await controller.sendOtpToPhone(
//                                   //           _phoneTEController.text.trim());
//                                   //   if (result) {
//                                   //     Get.to(() => VerifyOTPScreen(
//                                   //          phone:_phoneTEController.text.trim(),
//                                   //         ));
//                                   //   } else {
//                                   //     Get.showSnackbar(
//                                   //       GetSnackBar(
//                                   //         title: 'Send OTP failed',
//                                   //         message: controller.errorMessage,
//                                   //         duration: const Duration(seconds: 2),
//                                   //         isDismissible: true,
//                                   //       ),
//                                   //     );
//                                   //   }
//                                   // }
//                                 },
//                                 child: const Text('Next')),
//                            ),
//                          ),
//                 //       ));
//                 // })
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
