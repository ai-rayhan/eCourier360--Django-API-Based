
import 'package:e_courier_360/data/helper/date_converter.dart';
import 'package:e_courier_360/data/models/parcel.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_status_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/parcels_screen/percel_view_screen.dart';
import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:e_courier_360/presentation/utility/box_decoration.dart';
import 'package:e_courier_360/presentation/utility/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackingCard extends StatelessWidget {
  const TrackingCard({super.key, required this.parcel});
 final Parcel parcel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(PercelViewScreen(parcelData: parcel,));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
        child: Container(
          height: 130,
          width: double.infinity,
          decoration: AppBoxDecoration.whiteDecoration,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('Shipment Number',style: AppTextStyle.primary14w600,),Text(parcel.voucherId,style: AppTextStyle.darkGrey14Bold,)],),
              Container( 
                decoration: const BoxDecoration(color: Color.fromARGB(143, 255, 171, 15),borderRadius:BorderRadius.all(Radius.circular(12))),
                child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(children: [const Icon(Icons.update,size: 16,),const SizedBox(width: 2,),Text(Get.find<DeliveryStatusController>().deliveryStatus(parcel.deliveryStatus).status,style: const TextStyle(fontSize: 13),)],),
              ),)
              ],),
              const Divider(height: 3,),
              Text("Sending To: ${parcel.deliveryAddress}",maxLines: 3,overflow: TextOverflow.ellipsis ,style: TextStyle(color: Colors.grey[700],fontFamily: FontFamily.popins,fontSize: 13),),
               const SizedBox(height: 4,),
              Row(children: [
                const SizedBox(width: 5,),
                Text("৳ ${parcel.parcelEquivalentPrice}",style: TextStyle(fontFamily: FontFamily.popins,fontSize: 16,color: AppColors.primaryColor),),
                const SizedBox(width: 5,),
                const CircleAvatar(radius: 4,),
                 const SizedBox(width: 5,),
                Text(charMonthDDYYY(parcel.createdAt),style:AppTextStyle.darkGrey13Bold,)
                ],)
              ],
            ),
          ),
         
        ),
      ),
    );
  }
}


// import 'package:e_courier_360/data/helper/date_converter.dart';
// import 'package:e_courier_360/data/models/body/booking.dart';
// import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/update_status_controller.dart';
// import 'package:e_courier_360/presentation/ui/screens/common_module/parcels_screen/percel_view_screen.dart';
// import 'package:e_courier_360/presentation/utility/app_colors.dart';
// import 'package:e_courier_360/presentation/utility/box_decoration.dart';
// import 'package:e_courier_360/presentation/utility/status_icon.dart';
// import 'package:e_courier_360/presentation/utility/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TrackingCard extends StatelessWidget {
//   const TrackingCard({super.key, required this.parcel});
//   final Booking parcel;
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ParcelStatusController>(
//       builder: (controller) {
//         bool isSelected = controller.isSelected(parcel);

//         return InkWell(
//           onTap: () {
//             if (controller.isSelectionMode()) {
//               controller.toggleSelection(parcel);
//             } else {
//               Get.to(PercelViewScreen(parcelData: parcel));
//             }
//           },
//           onLongPress: () {
//             if (AuthController.userRole == "Superadmin" &&
//                 parcel.status!.id < 8) {
//               controller.toggleSelection(parcel);
//             }
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
//             child: Container(
//               height: 135,
//               width: double.infinity,
//               decoration: isSelected
//                   ? BoxDecoration(
//                       color: AppColors.secondaryColor.withOpacity(0.3),
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: AppColors.secondaryColor),
//                     )
//                   : AppBoxDecoration.whiteDecoration,
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Shipment Number',
//                                 style: AppTextStyle.primary14w600),
//                             Text(parcel.voucherId,
//                                 style: AppTextStyle.darkGrey14Bold),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Container(
//                               decoration: const BoxDecoration(
//                                 color: Color.fromARGB(143, 255, 187, 61),
//                                 borderRadius: BorderRadius.all(Radius.circular(12)),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(5.0),
//                                 child: Row(
//                                   children: [
//                                     Icon(statusIcons[parcel.status!.id - 1],size: 15,color: colors[parcel.status!.id-1],),
//                                     const SizedBox(width: 2),
//                                     Text(
//                                       parcel.status!.status,
//                                       style: const TextStyle(fontSize: 12),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                               Padding(
//                                 padding: const EdgeInsets.all(2.0),
//                                 child: Row(
//                                   children: [
//                                     const Text("Payment:",style: TextStyle(fontSize: 10)),
//                                     Row(
//                                       children: [
//                                         const SizedBox(width: 2),
//                                         const Text("Merchant",
//                                           style: TextStyle(fontSize: 10),
//                                         ),
//                                       if( parcel.paymentStatus==1)
//                                        const Icon(Icons.cancel_outlined,size: 13,color: Colors.red,),
//                                       if( parcel.paymentStatus==2)
//                                        const Icon(Icons.check_circle_outline_sharp,size: 13,color: Colors.green,),
//                                       ],
//                                     ),
//                                       Row(
//                                         children: [
//                                           const SizedBox(width: 2),
//                                           const Text("Rider",
//                                             style: TextStyle(fontSize: 10),
//                                           ),
//                                         if( parcel.driverPaymentStatus==1)
//                                        const Icon(Icons.cancel_outlined,size: 13,color: Colors.red,),
//                                         if( parcel.driverPaymentStatus==2)
//                                        const Icon(Icons.check_circle_outline_sharp,size: 13,color: Colors.green,),
//                                         ],
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                           ],
//                         ),
                      
                        
                     
//                       ],
//                     ),
                    
//                     const Divider(height: 3),
//                     Text(
//                       "Sending To: ${parcel.deliveryAddress}",
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         color: Colors.grey[700],
//                         fontFamily: FontFamily.popins,
//                         fontSize: 13,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       children: [
//                         const SizedBox(width: 5),
//                         Text(
//                           "৳ ${parcel.cashCollection}",
//                           style: TextStyle(
//                             fontFamily: FontFamily.popins,
//                             fontSize: 16,
//                             color: AppColors.primaryColor,
//                           ),
//                         ),
//                         const SizedBox(width: 5),
//                         const CircleAvatar(radius: 4),
//                         const SizedBox(width: 5),
//                         Text(
//                           DateConverter.charMonthDDYYY(parcel.createdAt),
//                           style: AppTextStyle.darkGrey13Bold,
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
