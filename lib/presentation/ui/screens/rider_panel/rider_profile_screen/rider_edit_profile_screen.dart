// import 'package:e_courier_360/data/models/body/rider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:e_courier_360/presentation/state_holders/rider_controller.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
// import 'package:e_courier_360/presentation/ui/widgets/merchant/credential_form.dart';
// import 'package:e_courier_360/presentation/ui/widgets/rider/rider_form.dart';

// class RiderEditProfileScren extends StatefulWidget {
//   const RiderEditProfileScren({super.key});

//   @override
//   State<RiderEditProfileScren> createState() => _RiderEditProfileScrenState();
// }

// class _RiderEditProfileScrenState extends State<RiderEditProfileScren> {
// @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {

//       await Get.find<RiderController>().getRiderProfile();

//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return RiderProfileEditScreen(rider: Get.find<RiderController>().riderList!.first,);
//   }
// }


// class RiderProfileEditScreen extends StatefulWidget {
//   const RiderProfileEditScreen({super.key, required this.rider});
//   final Rider rider;
//   @override
//   State<RiderProfileEditScreen> createState() => _RiderProfileEditScreenState();
// }

// class _RiderProfileEditScreenState extends State<RiderProfileEditScreen> {
//   final TextEditingController _userNameTEController = TextEditingController();
//   final TextEditingController _fullNameTEController = TextEditingController();
//   final TextEditingController _emailTEController = TextEditingController();
//   final TextEditingController _phoneTEController = TextEditingController();
//   final TextEditingController _addressTEController = TextEditingController();
//   final TextEditingController _vehicleTypeTEController = TextEditingController();
//   final TextEditingController _registrationNumberTEController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confimPasswordController = TextEditingController();
//   int? status;
//   @override
//   void initState() {
//     _userNameTEController.text=widget.rider.username;
//     _fullNameTEController.text=widget.rider.fullName;
//     _emailTEController.text=widget.rider.email;
//     _vehicleTypeTEController.text=widget.rider.vehicleType;
//     _phoneTEController.text=widget.rider.phone;
//     _addressTEController.text=widget.rider.address;
//     _registrationNumberTEController.text=widget.rider.registrationNumber;
//     _passwordController.text='';
//     _confimPasswordController.text='';
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 RiderForm(
//                   userNameController: _userNameTEController,
//                   fullNameController: _fullNameTEController,
//                   emailController: _emailTEController,
//                   phoneController: _phoneTEController,
//                   addressController: _addressTEController,
//                   vehicleTypeController: _vehicleTypeTEController,
//                   registrationNumberController: _registrationNumberTEController,
//                 ),
//                 const HeaderText(title: "Credential:"),
//                 CredentialForm(
//                    statusId:Get.find<RiderController>().getStatus(widget.rider.id),
//                    onStatusChanged: (index, value) {
//                    status=index+1;
//                   },
//                     passwordController: _passwordController,
//                     confimPasswordController: _confimPasswordController,
//                   ),
//                 GetBuilder<RiderController>(
//                   builder: (controller) {
//                     return SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () async {
//                          final result = await controller.updateProfile(
//                             userName: _userNameTEController.text,
//                             fullName: _fullNameTEController.text,
//                             email: _emailTEController.text,
//                             phone: _phoneTEController.text,
//                             address: _addressTEController.text,
//                             vehicleType: _vehicleTypeTEController.text,
//                             registrationNumber: _registrationNumberTEController.text,
//                             password: _passwordController.text,
//                             passwordConfirmation: _confimPasswordController.text,
//                             riderId: widget.rider.id,
//                             status: status!
//                           );
                    
//                           if (result) {
//                             Get.snackbar("success", "Profile updated successfully");
//                           } else {
//                             Get.snackbar("Failed", "Failed to update profile");
//                           }
//                         },
//                         child: const Text("Update"),
//                       ),
//                     );
//                   }
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }