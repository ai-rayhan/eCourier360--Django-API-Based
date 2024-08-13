
// import 'package:e_courier_360/presentation/state_holders/merchant_controller.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class EditBankInfoScreen extends StatefulWidget {
//   const EditBankInfoScreen({super.key});

//   @override
//   State<EditBankInfoScreen> createState() => _EditBankInfoScreenState();
// }

// class _EditBankInfoScreenState extends State<EditBankInfoScreen> {

//   String? 
//       bankName,
//       accountNumber,
//       accountName,
//       branch,
//       mobileNo;

//   final _formKey = GlobalKey<FormState>();
//   final ImagePicker picker = ImagePicker();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text(
//             "Edit Bank Information",
//             style: TextStyle(color: Colors.white),
//           ),
//           leading: IconButton(
//               onPressed: () => Navigator.pop(context),
//               icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
//         ),
//         body: GetBuilder<MerchantController>(
//             builder: (mController) {
//           return Visibility(
//             visible: !mController.inProgress,
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
//                       if(mController.merchantDetails?.bankInformation!=null)
//                       ListView.builder(
//                         itemCount:mController.merchantDetails?.bankInformation?.length,
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemBuilder: (context,index){
//                         return Column(children: [
                          
//                       Row(
//                         children: [
//                           Expanded(
//                             child: CustomInputField(
//                               initialValue:
//                                  mController.merchantDetails!.bankInformation![index].bankName,
//                               hintText: "Bank Name",
//                               headerText: "Bank Name",
//                               onSavedForm: (val) => bankName=val,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: CustomInputField(
//                               initialValue:mController.merchantDetails!.bankInformation![index].accountName,
//                               hintText: "Account Name",
//                               headerText: "Account Name",
//                               onSavedForm: (val) => accountName=val,
//                             ),
//                           ),
//                         ],
//                       ),
                    
//                       Row(
//                         children: [
//                           Expanded(
//                             child: CustomInputField(
//                               initialValue:mController.merchantDetails!.bankInformation![index].branch,
//                               hintText: "Branch Name",
//                               headerText: "Branch Name",
//                               onSavedForm: (val) => branch=val,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: CustomInputField(
//                               initialValue:mController.merchantDetails!.bankInformation![index].accountNumber,
//                               hintText: "Account Number",
//                               headerText: "Account Number",
//                               onSavedForm: (val) => accountNumber=val,
//                             ),
//                           ),
//                         ],
//                       ),
//                         ],);
//                       }),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             _formKey.currentState!.validate();
//                             _formKey.currentState!.save();
//                             // _profileController.updateProfile(
//                             //   bankName!, accountNumber!, accountName!, branch!, mobileNo!
//                             // );
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
