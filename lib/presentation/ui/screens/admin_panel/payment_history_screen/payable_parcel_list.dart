
import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
import 'package:e_courier_360/presentation/state_holders/payment_history_controller.dart';
import 'package:e_courier_360/presentation/state_holders/update_status_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_list_tile.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/empty_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentList extends StatefulWidget {
  const PaymentList({super.key, this.tabId});
  final int? tabId;

  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
 final ParcelController parcelController=Get.find<ParcelController>();
 @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(widget.tabId==0){
      Get.find<PaymentHistoryController>().getMerchantSettlement();
      }else{
        Get.find<PaymentHistoryController>().getRiderSettlement();
      }
        
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
    return  GetBuilder<PaymentHistoryController>(
      builder: (parcelController) {
        if(widget.tabId==0 && parcelController.merchantSettlements.isEmpty){
          return const EmptyDataPage(msg: "No Payable parcel available",);
        }else if(parcelController.riderSettlements.isEmpty){
          return const EmptyDataPage(msg: "No Payable parcel available",);
        }
        return Visibility(
          visible: !parcelController.inProgress,
          replacement: const CircularProgressIndicator(),
          child: ListView.builder(
            itemCount:widget.tabId==0? parcelController.merchantSettlements.length:parcelController.riderSettlements.length,
            itemBuilder: (context,index)=>CustomListTile(title: 'title', subtitle: 'subtitle'))
            // TrackingCard(parcel:widget.tabId==0? parcelController.merchantSettlements[index]:parcelController.riderSettlements[index])),
        );
      }
    );
  }
}
