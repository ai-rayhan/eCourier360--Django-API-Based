// import 'package:flutter/material.dart';
// import 'package:e_courier_360/presentation/ui/screens/admin_panel/merchants_screen/deprecated/merchant_edit_screen.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
// import 'package:e_courier_360/presentation/utility/box_decoration.dart';

// import '../data/models/merchant.dart';

// class MerchantDetailsScreen extends StatefulWidget {
//   const MerchantDetailsScreen({super.key, required this.merchant});
//   final Merchant merchant;
//   @override
//   MerchantDetailsScreenState createState() => MerchantDetailsScreenState();
// }

// class MerchantDetailsScreenState extends State<MerchantDetailsScreen>
//     with SingleTickerProviderStateMixin {
//   // late TabController _tabController;
//   // final List<String> _tabs = [
//   //   'Edit Merchant',
//   //   // 'Credential',
//   //   'Merchant Summury'
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
//         title: "Merchant",
//         // bottom: CustomTabBar(tabController: _tabController, tabs: _tabs),
//       ),
//       body: 
//       // Padding(
//       //   padding: const EdgeInsets.all(12.0),
//       //   child: TabBarView(
//       //     controller: _tabController,
//       //     children:  [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: MerchantEditScreen(merchant:widget.merchant),
//             ),
//             // CredentialEditScreen(merchant: widget.merchant,),
//             // MerchantParcelSummury()
//       //     ],
//       //   ),
//       // ),
//     );
//   }
// }

// // class CredentialEditScreen extends StatefulWidget {
// //   const CredentialEditScreen({super.key, required this.merchant});
// //   final Merchant merchant;
// //   @override
// //   State<CredentialEditScreen> createState() => _CredentialEditScreenState();
// // }

// // class _CredentialEditScreenState extends State<CredentialEditScreen> {
// //   final TextEditingController _passwordController = TextEditingController();
// //   final TextEditingController _confimPasswordController = TextEditingController();
// //   int? status;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         CredentialForm(
// //          onStatusChanged: (index, value) {
// //          status=index+1;
// //         },
// //           passwordController: _passwordController,
// //           confimPasswordController: _confimPasswordController,
// //         ),
// //           GetBuilder<MerchantProfileController>(
// //               builder: (controller) {
// //                 return Visibility(
// //                   visible: !controller.inProgress,
// //                   replacement: const CenterCircularProgressIndicator(),
// //                   child: SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){
                    
// //                     controller.updateProfile(widget.merchant.username, widget.merchant.fullName,widget.merchant.shopName, widget.merchant.shopEmail,widget.merchant.pickupPhone,widget.merchant.pickupAddress, widget.merchant.shopAddress,widget.merchant.id,_passwordController.text,status);
// //                   }, child:const Text("Update")),),
// //                 );
// //               }
// //             )
// //       ],
// //     );
// //   }
// // }


// // import 'package:flutter/material.dart';

