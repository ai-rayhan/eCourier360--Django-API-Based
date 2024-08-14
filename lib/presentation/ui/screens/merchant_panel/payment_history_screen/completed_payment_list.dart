import 'package:e_courier_360/presentation/state_holders/payment_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/merchant_panel/payment_history_screen/payment_history_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/empty_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedListScreen extends StatelessWidget {
  const CompletedListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      builder: (controller) {
        final ledger = controller.paymentList;
        if(controller.inProgress){
          return const CenterCircularProgressIndicator();
        }
        if(ledger.isEmpty){
          return const EmptyDataPage(msg: "No Payment Found",);
        }
        return ListView.builder(
          itemCount: ledger.length,
          itemBuilder: (context, index) {
            final item = ledger[index];
            return PaymentListItem(
              title: "Total Payment: ${item.totalPayment}",
              subtitle: "Total Parcel: ${item.totalParcel}; Total Parcel Amount: ${item.totalParcelAmount}\n ${item.paymentInfo}",
            );
          },
        );
      },
    );
  }
}