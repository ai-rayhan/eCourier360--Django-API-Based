
// import 'package:courier_management_marchant/presentation/state_holders/merchant_profile_controller.dart';
// import 'package:courier_management_marchant/presentation/ui/screens/bottom_navigationbar/bottomnavbar.dart';
// import 'package:courier_management_marchant/presentation/ui/widgets/common/input_card.dart';
// import 'package:courier_management_marchant/utility_urls.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AddShopScreen extends StatefulWidget {
//   const AddShopScreen({super.key});

//   @override
//   State<AddShopScreen> createState() => _AddShopScreenState();
// }

// class _AddShopScreenState extends State<AddShopScreen> {
//   final TextEditingController _shopNameTEController =
//       TextEditingController();
//   final TextEditingController _shopEmailTEController =
//       TextEditingController();
//   final TextEditingController _shopAddressTEController =
//       TextEditingController();
//   final TextEditingController _pickupPhoneTEController =
//       TextEditingController();
//   final TextEditingController _pickupZoneTEController =
//       TextEditingController();

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
//                   height: 48,
//                 ),
//                 Image.asset(AssetsPath.shop,height: 170,),
//                 const SizedBox(
//                   height: 24.0,
//                 ),
//                 Text(
//                   'Add Shop Information',
//                   style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                         fontSize: 22,
//                       ),
//                 ),
//                 const SizedBox(
//                   height: 4.0,
//                 ),
//                 Text(
//                   'Give your shop details to find your product easily',
//                   style: Theme.of(context).textTheme.bodySmall,
//                 ),
//                 const SizedBox(
//                   height: 16.0,
//                 ),
//                 const SizedBox(
//                   height: 16.0,
//                 ),
//                 InputCard(
//                   child: TextFormField(
//                     controller: _shopNameTEController,
//                     textInputAction: TextInputAction.next,
//                     decoration:
//                         (const InputDecoration(hintText: 'Shop Name')),
//                     validator: (value) {
//                       if (value?.isEmpty ?? true) {
//                         return 'Enter Shop Name';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 7.0,
//                 ),
//                 InputCard(
//                   child: TextFormField(
//                     controller: _shopEmailTEController,
//                     keyboardType: TextInputType.phone,
//                     textInputAction: TextInputAction.next,
//                     decoration:
//                         (const InputDecoration(hintText: 'Shop Email')),
//                     validator: (value) {
//                       if (value?.isEmpty ?? true) {
//                         return 'Enter Shop Email';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 InputCard(
//                   child: TextFormField(
//                     controller: _shopAddressTEController,
//                     textInputAction: TextInputAction.next,
//                     decoration:
//                         (const InputDecoration(hintText: 'Shop Address')),
//                     validator: (value) {
//                       if (value?.isEmpty ?? true) {
//                         return 'Enter Shop Address';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 InputCard(
//                   child: TextFormField(
//                     controller: _pickupPhoneTEController,
//                     textInputAction: TextInputAction.next,
//                     keyboardType: TextInputType.phone,
//                     decoration:
//                         (const InputDecoration(hintText: 'Pickup Phone')),
//                     validator: (value) {
//                       if (value?.isEmpty ?? true) {
//                         return 'Enter  pickup phone';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 InputCard(
//                   child: TextFormField(
//                     controller: _pickupZoneTEController,
//                     textInputAction: TextInputAction.next,
//                     keyboardType: TextInputType.phone,
//                     decoration: (const InputDecoration(hintText: 'Pickup Zone')),
//                     validator: (value) {
//                       if (value?.isEmpty ?? true) {
//                         return 'Enter pickup';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 SizedBox(
//                       width: double.infinity,
//                         child: GetBuilder<MerchantProfileController>(
//                           builder: (merchantProfileController) {
//                             return Visibility(
//                                visible: merchantProfileController.inProgress == false,
//                                replacement: const Center(child:  CircularProgressIndicator(),),
//                               child: ElevatedButton(
//                                 onPressed: ()async{
//                                   if (!_formkey.currentState!.validate()) {
//                                    return;
//                                  }
//                                  final bool response =await merchantProfileController.addShop(_shopNameTEController.text, _shopEmailTEController.text, _shopAddressTEController.text, _pickupZoneTEController.text, _pickupPhoneTEController.text);
//                                  if (response) {
//                                    if (mounted) {
//                                      Navigator.push(context,
//                                          MaterialPageRoute(builder: (context) =>  const MainBottomNavScreen()));
//                                    }
//                                  } else {
//                                      if (mounted) {
//                                        Get.snackbar('Wrong!','Login failed. Try again');
                                      
//                                      }
//                                    }
//                                 },
                                
                                
//                                 child: const Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text('Next', style: TextStyle(fontSize: 18),),
//                                     SizedBox(width: 10,),
//                                     Icon(Icons.arrow_circle_right_outlined),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           }
//                         ),
                     
//                     ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _shopNameTEController.dispose();
//     _shopEmailTEController.dispose();
//     _shopAddressTEController.dispose();
//     _pickupPhoneTEController.dispose();
//     _pickupZoneTEController.dispose();

//     super.dispose();
//   }
// }
