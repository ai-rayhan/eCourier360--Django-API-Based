
// import 'package:e_courier_360/utility_urls.dart';
// import 'package:flutter/material.dart';

// class HomeTrackingCard extends StatelessWidget {
//   const HomeTrackingCard({super.key, required this.shipment});
//  final Shipment shipment;
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Container(
//         height: 210,
//         width: double.infinity,
//         decoration: AppBoxDecoration.whiteDecoration,
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//             Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [Text('Shipment Number',style: AppTextStyle.primary14w600,),Text(shipment.shipmentNumber,style: AppTextStyle.darkGrey14Bold,)],),
//             Image.asset(AssetsPath.track,height: 40,width: 40,)
//             ],),
//             const Divider(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//               Column(children: [Row(children: [CircleAvatar(radius: 20, child: Center(child: Image.asset(AssetsPath.senderBox,height: 25,width: 25,)),), const SizedBox(width: 5,)  ,Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [Text("Sender",style: AppTextStyle.primary14w600,),Text(shipment.senderLocation)],)],)],),
//               Column(children: [Text("Time",style: AppTextStyle.primary14w600,),Text(shipment.delivaryTime)],)
//             ],),
//             const SizedBox(height: 12,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//               Column(children: [Row(children: [CircleAvatar(radius: 20, child: Center(child: Image.asset(AssetsPath.reciverBox,height: 25,width: 25,)),), const SizedBox(width: 5,) ,Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ Text("Reciver",style: AppTextStyle.primary14w600,),Text(shipment.reciverLocation)],)],)],),
//               Column(children: [Text("Status",style: AppTextStyle.primary14w600,),Text(shipment.status)],)
//             ],),
//             const SizedBox(height: 13,),
//             GestureDetector(onTap: (){}, child:  Text("See More",style: AppTextStyle.primary14w600,))
//             ],
//           ),
//         ),
       
//       ),
//     );
//   }
// }
