// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
// import 'package:timeline_tile/timeline_tile.dart';

// class OrderTrackingScreen extends StatelessWidget {
//   const OrderTrackingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ParcelController controller = Get.put(ParcelController());
//     return Scaffold(
//       appBar: const CourierAppBar(title: "Tracking Parcel",),
//           body:  ListView.builder(
//             itemCount: controller.parcelResponse.data.booking?.statusHistory.length??0,
//             itemBuilder: (context, index) {
//               final status = controller.parcelResponse.data.booking!.statusHistory[index];
//               return TimelineTile(
//                 alignment: TimelineAlign.manual,
//                 lineXY: 0.1,
//                 isFirst: index == 0,
//                 isLast: index == controller.parcelResponse.data.booking!.statusHistory.length - 1,
//                 indicatorStyle: IndicatorStyle(
//                   width: 40,
//                   height: 40,
//                   indicatorXY: 0.5,
//                   iconStyle: IconStyle(
//                     iconData: _getIcon(status.status.icon),
//                     color: Colors.white,
//                   ),
//                   color: _getColor(status.status.colorCode),
//                 ),
//                 beforeLineStyle: LineStyle(
//                   color: _getColor(status.status.colorCode),
//                   thickness: 6,
//                 ),
//                 endChild: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             status.date,
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           const Spacer(),
//                           Text(
//                             getTimeAgo(status.createdAt),
//                             style: const TextStyle(color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                             decoration: BoxDecoration(
//                               color: _getColor(status.status.colorCode).withOpacity(0.1),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Text(
//                               status.status.status,
//                               style: TextStyle(
//                                 color: _getColor(status.status.colorCode),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       Text(status.statusMode),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           const Spacer(),
//                           Text(
//                             'updated by ${status.createdBy}',
//                             style: const TextStyle(color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           )
//     );
//   }

//   IconData _getIcon(String icon) {
//     switch (icon) {
//       case 'fas fa-pause-circle':
//         return Icons.pause_circle_filled;
//       case 'fas fa-truck-pickup':
//         return Icons.local_shipping;
//       case 'fas fa-exchange':
//         return Icons.swap_horiz;
//       case 'fas fa-truck-loading':
//         return Icons.local_shipping;
//       case 'fas fa-check':
//         return Icons.check_circle;
//       case 'fa fa-upload':
//         return Icons.upload_file;
//       default:
//         return Icons.info;
//     }
//   }

//   Color _getColor(String colorCode) {
//     switch (colorCode) {
//       case 'badge badge-light':
//         return Colors.grey;
//       case 'badge badge-warning':
//         return Colors.orange;
//       case 'badge badge-danger':
//         return Colors.red;
//       case 'badge badge-secondary':
//         return Colors.blueGrey;
//       case 'badge badge-success':
//         return Colors.green;
//       case 'badge badge-primary':
//         return Colors.blue;
//       default:
//         return Colors.blue;
//     }
//   }

// String getTimeAgo(String createdAt) {
//   final date = DateTime.parse(createdAt);
//   final now = DateTime.now();
//   final difference = now.difference(date);

//   if (difference.inDays > 0) {
//     return '${difference.inDays} days ago';
//   } else if (difference.inHours > 0) {
//     return '${difference.inHours} hours ago';
//   } else {
//     return '${difference.inMinutes} minutes ago';
//   }
// }

// }
