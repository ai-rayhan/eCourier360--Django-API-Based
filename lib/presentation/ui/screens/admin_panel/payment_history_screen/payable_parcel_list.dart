
import 'package:e_courier_360/data/models/merchant_settlement.dart';
import 'package:e_courier_360/data/models/rider_settlement.dart';
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount:widget.tabId==0? parcelController.merchantSettlements.length:parcelController.riderSettlements.length,
              itemBuilder: (context,index){ 
                if(widget.tabId==0){
                  MerchantSettlement merchantSettlement=parcelController.merchantSettlements[index];
                  return CustomListTile(leading: CircleAvatar(child: Text(merchantSettlement.id.toString()),), title:  "Merchant name:${merchantSettlement.merchant} ",
                   subtitle: "Payment Method:${merchantSettlement.paymentMethod} Payment by:${merchantSettlement.createdBy}");
                }else{
                  RiderSettlement riderSettlement=parcelController.riderSettlements[index];
                  return CustomListTile(
                    leading: CircleAvatar(child: Text(riderSettlement.id.toString()),),
                    title:  "Rider name:${riderSettlement.rider} ",
                   subtitle: "Payment Method:${riderSettlement.paymentMethod} Payment by:${riderSettlement.createdBy}");
                }}),
          )
            // TrackingCard(parcel:widget.tabId==0? parcelController.merchantSettlements[index]:parcelController.riderSettlements[index])),
        );
      }
    );
  }





  
}
