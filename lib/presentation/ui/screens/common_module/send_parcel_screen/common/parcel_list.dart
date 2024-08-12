import 'dart:developer';

import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/parcel/tracking_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParcelList extends StatefulWidget {
  const ParcelList({super.key, required this.deliveryStatusId, this.voucherId});
  final int deliveryStatusId;
  final String? voucherId;

  @override
  State<ParcelList> createState() => _ParcelListState();
}

class _ParcelListState extends State<ParcelList> {
 final ParcelController parcelController=Get.find<ParcelController>();
 @override
  void initState() {
  
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // if(widget.deliveryStatusId==-1){
      //   parcelController.getMerchantParcels();
      // }else
      //  if(widget.voucherId!=null){
      //    parcelController.getParcelsByVoucherId(widget.voucherId??"");
      // }
      // else{
        parcelController.getParcelsByStatus(widget.deliveryStatusId);
         log("message:${widget.deliveryStatusId}");
      // }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ParcelController>(
      builder: (parcelController) {
        return Visibility(
          visible: !parcelController.inProgress,
          replacement: const CircularProgressIndicator(),
          child: ListView.builder(
            itemCount: parcelController.parcels.length,
            itemBuilder: (context,index)=>TrackingCard(parcel: parcelController.parcels[index])),
        );
      }
    );
  }
}


// import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/update_status_controller.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/empty_data.dart';
// import 'package:e_courier_360/presentation/ui/widgets/parcel/tracking_card.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ParcelList extends StatefulWidget {
//   const ParcelList({super.key, required this.deliveryStatusId, this.voucherId});
//   final int deliveryStatusId;
//   final String? voucherId;

//   @override
//   State<ParcelList> createState() => _ParcelListState();
// }

// class _ParcelListState extends State<ParcelList> {
//  final ParcelController parcelController=Get.find<ParcelController>();
//  @override
//   void initState() {
  
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//         parcelController.getParcelsByStatus(widget.deliveryStatusId);
//         Get.find<ParcelStatusController>().uiclearSelection();

//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return  GetBuilder<ParcelController>(
//       builder: (parcelController) {
//         return parcelController.bookingListResponse!=null? Visibility(
//           visible: !parcelController.inProgress,
//           replacement: const CircularProgressIndicator(),
//           child: Visibility(
//             visible: parcelController.bookingListResponse!.data.booking.isNotEmpty,
//             replacement: const EmptyDataPage(msg: "No Parcel Found",),
//             child: ListView.builder(
//               itemCount: parcelController.bookingListResponse?.data.booking.length??0,
//               itemBuilder: (context,index)=>TrackingCard(parcel: parcelController.bookingListResponse!.data.booking[index])),
//           ),
//         ):  const EmptyDataPage(msg: "Some thing went Wrong",);
//       }
//     );
//   }
// }
// class Loader extends StatelessWidget {
//   const Loader({super.key,required this.replacement,required this.child, this.show=false});
// final bool show;
// final Widget child;
// final Widget replacement;
//   @override
//   Widget build(BuildContext context) {
//     return show?replacement:child;
//   }
// }