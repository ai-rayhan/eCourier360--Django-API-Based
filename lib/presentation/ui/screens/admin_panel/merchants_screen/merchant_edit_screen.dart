// import 'package:e_courier_360/data/models/body/merchant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:e_courier_360/presentation/state_holders/merchant_controller.dart';
// import 'package:e_courier_360/presentation/ui/screens/admin_panel/merchants_screen/merchants_screen.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
// import 'package:e_courier_360/presentation/ui/widgets/merchant/credential_form.dart';
// import 'package:e_courier_360/presentation/ui/widgets/merchant/merchant_form.dart';

// class MerchantEditScreen extends StatefulWidget {
//   const MerchantEditScreen({super.key, required this.merchant});
//   final Merchant merchant;
//   @override
//   State<MerchantEditScreen> createState() => _MerchantEditScreenState();
// }

// class _MerchantEditScreenState extends State<MerchantEditScreen> {
//   final TextEditingController _userNameTEController = TextEditingController();
//   final TextEditingController _fullNameTEController = TextEditingController();
//   final TextEditingController _shopEmailTEController = TextEditingController();
//   final TextEditingController _shopNameTEController = TextEditingController();
//   final TextEditingController _pickPhoneTEController = TextEditingController();
//   final TextEditingController _shopAddressTEController =
//       TextEditingController();
//   final TextEditingController _pickupAddressTEController =
//       TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   @override
//   void initState() {
//     _userNameTEController.text = widget.merchant.username;
//     _fullNameTEController.text = widget.merchant.fullName;
//     _shopEmailTEController.text = widget.merchant.shopEmail;
//     _shopNameTEController.text = widget.merchant.shopName;
//     _pickPhoneTEController.text = widget.merchant.pickupPhone;
//     _shopAddressTEController.text = widget.merchant.shopAddress;
//     _pickupAddressTEController.text = widget.merchant.pickupAddress;
//     status= widget.merchant.admin?.status??2;
//     super.initState();
//   }

//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confimPasswordController =
//       TextEditingController();
//   int status=2;

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             MerchantForm(
//               userNameController: _userNameTEController,
//               fullNameController: _fullNameTEController,
//               shopEmailController: _shopEmailTEController,
//               shopNameController: _shopNameTEController,
//               pickPhoneController: _pickPhoneTEController,
//               shopAddressController: _shopAddressTEController,
//               pickupAddressController: _pickupAddressTEController,
//             ),
//             const HeaderText(title: "Credential:"),
//             CredentialForm(
//               statusId:widget.merchant.admin?.status??2,
//               onStatusChanged: (index, value) {
//                 status = index + 1;
//               },
//               passwordController: _passwordController,
//               confimPasswordController: _confimPasswordController,
//             ),
//             GetBuilder<MerchantProfileController>(builder: (controller) {
//               return Visibility(
//                 visible: !controller.inProgress,
//                 replacement: const CenterCircularProgressIndicator(),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                       onPressed: () async{
//                       bool response=await controller.updateProfile(
//                         userName: _userNameTEController.text,
//                         fullname: _fullNameTEController.text,
//                         shopName: _shopNameTEController.text,
//                         shopEmail: _shopEmailTEController.text,
//                         pickupPhone: _pickPhoneTEController.text,
//                         pickupAddress: _pickupAddressTEController.text,
//                         shopAddress: _shopAddressTEController.text,
//                         merchantId: widget.merchant.id,
//                         password: _passwordController.text,
//                         status: status,
//                       );
//                        if (response) {
//                               if (mounted) {
//                                    Get.snackbar('Well Done!',
//                                     'Merchant Updated.');
//                                   Get.back();
//                                   Get.off(const MerchantsScreen());}
//                             } else {
//                               if (mounted) {
//                                 Get.snackbar('Wrong!',
//                                     'Apply failed. ${controller.errorMessage}');
//                               }
//                             }
//                       },
//                       child: const Text("Update")),
//                 ),
//               );
//             })
//           ],
//         ),
//       ),
//     );
//   }
// }
