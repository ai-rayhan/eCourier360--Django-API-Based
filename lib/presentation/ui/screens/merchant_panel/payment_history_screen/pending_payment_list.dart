
// import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
// import 'package:e_courier_360/presentation/ui/screens/merchant_panel/payment_history_screen/payment_history_screen.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/empty_data.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class PendingPaymentListScreen extends StatelessWidget {
//   const PendingPaymentListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ParcelController>(
//       builder: (controller) {
//         final parcels = controller.allStatusParcels;
//         if(controller.inProgress){
//           return const CenterCircularProgressIndicator();
//         }
//         if (parcels.isEmpty) {
//           return const EmptyDataPage(msg: "No Pending Payments");
//         }
//         return ListView.builder(
//           itemCount: parcels.length,
//           itemBuilder: (context, index) {
//             final parcel = parcels[index];
//             return PaymentListItem(
//               title: "Shipment Number: ${parcel.voucherId}",
//               subtitle: "Parcel Amount: ${parcel.cashCollection}; Parcel Status: ${parcel.status!.status}\nDelivery Charge: ${parcel.deliveryCharge}",
//             );
//           },
//         );
//       },
//     );
//   }
// }
