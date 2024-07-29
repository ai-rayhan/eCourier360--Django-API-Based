

// import 'package:flutter/material.dart';
// import 'package:e_courier_360/presentation/ui/screens/admin_panel/merchants_screen/merchant_profile_screen.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/space_between_row.dart';
// import 'package:e_courier_360/presentation/utility/box_decoration.dart';
// import 'package:e_courier_360/presentation/utility/sizedbox.dart';

// class MerchantParcelSummury extends StatelessWidget {
//   const MerchantParcelSummury({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: Column(
//           children: [
//             AppSizedBox.h16,
//             const CircleAvatar(
//               radius: 30.0,
//               backgroundColor: Colors.purple,
//               child: Text(
//                 'AA',
//                 style: TextStyle(fontSize: 24.0, color: Colors.white),
//               ),
//             ),
//             AppSizedBox.h10,
//             const Text(
//               'App (app)',
//               style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
//             ),
//             AppSizedBox.h16,
//             const HeaderText(title: "Shop Information:"),
//             const ShopInfoScreen(),
//             AppSizedBox.h16,
//             const HeaderText(title: "Parcel Information:"),
//           Container(
//             decoration: AppBoxDecoration.whiteDecoration,
//             child: const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Column(children: [  SpaceBetweenRow(title: 'Total Parcel', value: '0'),
//                 SpaceBetweenRow(title: 'Approved', value: '0'),
//                 SpaceBetweenRow(title: 'Delivery', value: '0'),
//                 SpaceBetweenRow(title: 'Partial', value: '0'),
//                 SpaceBetweenRow(title: 'Return + Returned', value: '0'),
//                 SpaceBetweenRow(title: 'Parcel Price', value: '0'),
//                 SpaceBetweenRow(title: 'Cash Collection', value: '0'),
//                 SpaceBetweenRow(title: 'Merchant Paid', value: '0'),
//                 SpaceBetweenRow(title: 'Delivery Charge (-)', value: '0'),],),
//             ),
//           )
//           ],
//         ),
//       ),
//     );
//   }
// }
