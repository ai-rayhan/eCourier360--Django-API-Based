
// import 'dart:developer';

// import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/merchant_profile_controller.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
// import 'package:e_courier_360/presentation/utility/sizedbox.dart';
// import 'package:e_courier_360/presentation/utility/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({super.key});

//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   final MerchantProfileController _profileController =
//       Get.find<MerchantProfileController>();

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       await _profileController.getProfileEdit();
//     });
//     super.initState();
//   }

//   String? userName,
//       fullname,
//       shopName,
//       shopEmail,
//       pickupPhone,
//       pickupAddress,
//       shopAddress;

//   final _formKey = GlobalKey<FormState>();
//   final ImagePicker picker = ImagePicker();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text(
//             "Edit Profile",
//             style: TextStyle(color: Colors.white),
//           ),
//           leading: IconButton(
//               onPressed: () => Navigator.pop(context),
//               icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
//         ),
//         body: GetBuilder<MerchantProfileController>(
//             builder: (mcProfileController) {
//           return Visibility(
//             visible: !mcProfileController.inProgress,
//             replacement: const Center(
//               child: CircularProgressIndicator(),
//             ),
//             child: ListView(
//               padding: const EdgeInsets.all(14),
//               children: <Widget>[
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     children: <Widget>[

//                       Row(
//                         children: [
//                           Expanded(
//                             child: CustomInputField(
//                               initialValue:
//                                   _profileController.currentUser?.username,
//                               hintText: "User Name",
//                               headerText: "User Name",
//                               onSavedForm: (val) => userName=val,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: CustomInputField(
//                               initialValue:
//                                   _profileController.currentUser?.fullName,
//                               hintText: "Full Name",
//                               headerText: "Full Name",
//                               onSavedForm: (val) => fullname=val,
//                             ),
//                           ),
//                         ],
//                       ),
                    
//                       Row(
//                         children: [
//                           Expanded(
//                             child: CustomInputField(
//                               initialValue:
//                                   _profileController.currentUser?.shopName,
//                               hintText: "Shop Name",
//                               headerText: "Shop Name",
//                               onSavedForm: (val) => shopName=val,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: CustomInputField(
//                               initialValue:
//                                   _profileController.currentUser?.shopEmail,
//                               hintText: "Shop Email",
//                               headerText: "Shop Email",
//                               onSavedForm: (val) => shopEmail=val,
//                             ),
//                           ),
//                         ],
//                       ),
                    
//                       Row(
//                         children: [
//                           Expanded(
//                             child: CustomInputField(
//                               initialValue:
//                                   _profileController.currentUser?.shopAddress,
//                               hintText: "Shop Address",
//                               headerText: "Shop Address",
//                               onSavedForm: (val) => shopAddress=val,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: CustomInputField(
//                               initialValue:
//                                   _profileController.currentUser?.pickupAddress,
//                               hintText: "Pickup Address",
//                               headerText: "Pickup Address",
//                               onSavedForm: (val) => pickupAddress=val,
//                             ),
//                           ),
//                         ],
//                       ),
//                        CustomInputField(
//                          initialValue:
//                              _profileController.currentUser?.pickupPhone,
//                          hintText: "Pickup Phone",
//                          headerText: "Pickup Phone",
//                          onSavedForm: (val) => pickupPhone=val,
//                        ),
//                        AppSizedBox.h16,
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             _formKey.currentState!.validate();
//                             _formKey.currentState!.save();
//                             log(pickupAddress.toString());
//                             _profileController.updateProfile(name: fullname ,userName: userName!,fullname: fullname,shopName: shopName,shopEmail: shopEmail,pickupPhone: pickupPhone,pickupAddress: pickupAddress,shopAddress:  shopAddress,merchantId: AuthController.mcid!);
                             
//                           },
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Update',
//                                 style: TextStyle(fontSize: 18),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Icon(Icons.update),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }));
//   }
// }

// class Header2Text extends StatelessWidget {
//   const Header2Text({
//     super.key,
//     required this.title,
//   });
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 5),
//       child: Row(
//         children: [
//           Text(title,
//               style: TextStyle(
//                   fontFamily: FontFamily.popins,
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500)),
//         ],
//       ),
//     );
//   }
// }