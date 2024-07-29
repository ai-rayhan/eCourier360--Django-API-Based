// import 'package:e_courier_360/data/models/body/rider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:e_courier_360/presentation/state_holders/rider_controller.dart';
// import 'package:e_courier_360/presentation/ui/screens/admin_panel/riders_screen/riders_screen.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
// import 'package:e_courier_360/presentation/ui/widgets/merchant/credential_form.dart';
// import 'package:e_courier_360/presentation/ui/widgets/rider/rider_form.dart';

// class EditRiderScreen extends StatefulWidget {
//   const EditRiderScreen({super.key, required this.rider});
//   final Rider rider;
//   @override
//   EditRiderScreenState createState() => EditRiderScreenState();
// }

// class EditRiderScreenState extends State<EditRiderScreen>
//     with SingleTickerProviderStateMixin {
//   // late TabController _tabController;
//   // final List<String> _tabs = [
//   //   'Edit Rider',
//   //   'Credential',
//   // ];

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _tabController = TabController(length: _tabs.length, vsync: this);
//   // }

//   // @override
//   // void dispose() {
//   //   _tabController.dispose();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CourierAppBar(
//         title: "Edit Rider",
//         // bottom: CustomTabBar(tabController: _tabController, tabs: _tabs
//         // ),
//       ),
//       body: 
//       // Padding(
//       //   padding: const EdgeInsets.all(12.0),
//       //   child: TabBarView(
//       //     controller: _tabController,
//       //     children:  [
//             RiderProfileEditScreen(rider: widget.rider,));
//     //         CredentialEditScreen(),
//     //       ],
//     //     ),
//     //   ),
//     // );
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
//                     return Visibility(
//                       visible:!controller.inProgress,
//                       replacement: const CenterCircularProgressIndicator(),
//                       child: SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () async {
//                            final result = await controller.updateProfile(
//                               userName: _userNameTEController.text,
//                               fullName: _fullNameTEController.text,
//                               email: _emailTEController.text,
//                               phone: _phoneTEController.text,
//                               address: _addressTEController.text,
//                               vehicleType: _vehicleTypeTEController.text,
//                               registrationNumber: _registrationNumberTEController.text,
//                               password: _passwordController.text,
//                               passwordConfirmation: _confimPasswordController.text,
//                               riderId: widget.rider.id,
//                               status: status!
//                             );
                      
//                             if (result) {
//                              if (mounted) {
//                                Get.snackbar('Great!',
//                                       'Rider Updated. ${controller.errorMessage}');
//                              Get.back();
//                              Get.off(const RidersScreen());}
//                             } else {
//                               if (mounted) {
//                                   Get.snackbar('Wrong!',
//                                       'Operation Failed. ${controller.errorMessage}');
//                                 }
//                             }
//                           },
//                           child: const Text("Update"),
//                         ),
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

// // class CredentialEditScreen extends StatefulWidget {
// //   const CredentialEditScreen({super.key});

// //   @override
// //   State<CredentialEditScreen> createState() => _CredentialEditScreenState();
// // }

// // class _CredentialEditScreenState extends State<CredentialEditScreen> {
// //   final TextEditingController _userNameTEController = TextEditingController();
// //   final TextEditingController _fullNameTEController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         CredentialForm(
// //         onStatusChanged: (index, value) {
// //           // Handle the change in the parent widget
// //           print('Selected index: $index, value: $value');
// //         },
// //           passwordController: _fullNameTEController,
// //           confimPasswordController: _fullNameTEController,
// //         ),
// //         SizedBox(
// //           width: double.infinity,
// //           child: ElevatedButton(onPressed: () {}, child: const Text("Update")),
// //         )
// //       ],
// //     );
// //   }
// // }
