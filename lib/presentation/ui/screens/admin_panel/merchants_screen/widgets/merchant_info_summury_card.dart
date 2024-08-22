import 'package:e_courier_360/data/models/merchant.dart';
import 'package:e_courier_360/presentation/state_holders/parcel_summary_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/state_holders/merchant_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/merchants_screen/merchant_details_screen.dart';
import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:e_courier_360/presentation/utility/box_decoration.dart';
import 'package:e_courier_360/presentation/utility/text_style.dart';


class MerchantInfoSummuryCard extends StatelessWidget {
  const MerchantInfoSummuryCard({
    super.key,
    required this.merchant,
  });
  final Merchant merchant;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MerchantController>(
      builder: (controller) {
        return GestureDetector(
          onLongPress: () {
            controller.updateMerchantId(merchant.id);
          },
          onTap: (){
             if(controller.merchantIDList.isEmpty){
             Get.lazyPut<ParcelSummaryController>(() => ParcelSummaryController());
             Get.to( MerchantDetailsScreen(merchant:merchant.id));
             }else{
               controller.updateMerchantId(merchant.id);
             }

             },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: controller.merchantIDList.contains(merchant.id)?primaryDecoration(context):appBoxDecoration(context),
              width: double.infinity,
              child: ListTile(
                title: Text(
                  merchant.shopName,
                  style: AppTextStyle.darkGrey16Bold,
                ),
                subtitle: Text(
                  "Phone:${merchant.pickupPhone}\nEmail:${merchant.shopAddress}\nPickupAddress:${merchant.pickupAddress}",
                  style: AppTextStyle.darkgrey13,
                ),
                leading: const Icon(Icons.account_circle_sharp),
                trailing: Container(
                  height: 28,
                  width: 60,
                              decoration:  BoxDecoration(
                                color:merchant.status=='1'?Colors.green:AppColors.dark14,
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                                child: Row(
                                  children: [
                                    Text(
                                      merchant.status=="1"?"  Active":
                                      "Pending",
                                      style: const TextStyle(fontSize: 13,color: AppColors.whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        
              ),
            ),
          ),
        );
      }
    );
  }
}
