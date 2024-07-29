// import 'package:e_courier_360/data/models/body/merchant.dart';
// import 'package:flutter/material.dart';
// import 'package:e_courier_360/presentation/ui/screens/admin_panel/merchants_screen/merchant_edit_screen.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';

// class MerchantDetailsScreen extends StatefulWidget {
//   const MerchantDetailsScreen({super.key, required this.merchant});
//   final Merchant merchant;
//   @override
//   MerchantDetailsScreenState createState() => MerchantDetailsScreenState();
// }

// class MerchantDetailsScreenState extends State<MerchantDetailsScreen>
//     with SingleTickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CourierAppBar(
//         title: "Merchant",
//       ),
//       body: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: MerchantEditScreen(merchant:widget.merchant),
//             ),
//     );
//   }
// }