
import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
import 'package:e_courier_360/presentation/state_holders/update_status_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/empty_data.dart';
import 'package:e_courier_360/presentation/ui/widgets/parcel/tracking_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayableParcelList extends StatefulWidget {
  const PayableParcelList({super.key, this.tabId, required this.deliveryStatusIdList});
  final List<int> deliveryStatusIdList;
  final int? tabId;

  @override
  State<PayableParcelList> createState() => _PayableParcelListState();
}

class _PayableParcelListState extends State<PayableParcelList> {
 final ParcelController parcelController=Get.find<ParcelController>();
 @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        parcelController.getParcelsByMultipleStatuses(widget.deliveryStatusIdList);
        Get.find<ParcelStatusController>().updatePaymentTabId(widget.tabId!);
    });
    super.initState();
  }
  @override
  void dispose() {
    Get.find<ParcelStatusController>().clearSelection();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ParcelController>(
      builder: (parcelController) {
        if(widget.tabId==0 && parcelController.merchantPendingBooking.isEmpty){
          return const EmptyDataPage(msg: "No Payable parcel available",);
        }else if(parcelController.riderPendingBooking.isEmpty){
          return const EmptyDataPage(msg: "No Payable parcel available",);
        }
        return Visibility(
          visible: !parcelController.inProgress,
          replacement: const CircularProgressIndicator(),
          child: ListView.builder(
            itemCount:widget.tabId==0? parcelController.merchantPendingBooking.length:parcelController.riderPendingBooking.length,
            itemBuilder: (context,index)=>TrackingCard(parcel:widget.tabId==0? parcelController.merchantPendingBooking[index]:parcelController.riderPendingBooking[index])),
        );
      }
    );
  }
}
