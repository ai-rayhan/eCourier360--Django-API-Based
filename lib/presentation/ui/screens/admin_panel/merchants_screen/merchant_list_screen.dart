import 'package:e_courier_360/data/models/merchant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/state_holders/merchant_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/merchants_screen/merchant_profile_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:e_courier_360/presentation/utility/box_decoration.dart';
import 'package:e_courier_360/presentation/utility/text_style.dart';

class MerchantList extends StatefulWidget {
  const MerchantList({super.key});

  @override
  State<MerchantList> createState() => _MerchantListState();
}

class _MerchantListState extends State<MerchantList> {
MerchantController merchantController=Get.find();
   @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await merchantController.getAllMerchants();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<MerchantController>(
        builder: (controller) {
          return Visibility(
            visible: !controller.inProgress,
            replacement: const CenterCircularProgressIndicator(),
            child: ListView.builder(
                itemCount: controller.merchantList?.length??0,
                itemBuilder: (context, index) => MerchantInfoSummuryCard(
                      merchant: controller.merchantList![index],
                    )),
          );
        }
      ),
    );
  }
}

class MerchantInfoSummuryCard extends StatelessWidget {
  const MerchantInfoSummuryCard({
    super.key,
    required this.merchant,
  });
  final Merchant merchant;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to( MerchantDetailsScreen(merchant:merchant)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: AppBoxDecoration.whiteDecoration,
          width: double.infinity,
          child: ListTile(
            title: Text(
              merchant.merchantName,
              style: AppTextStyle.theme16w600,
            ),
            // subtitle: Text(
            //   "Phone:${merchant.pickupPhone}\nEmail:${merchant.shopEmail}\nPickupAddress:${merchant.pickupAddress}",
            //   style: AppTextStyle.darkgrey13,
            // ),
            leading: const Icon(Icons.account_circle_sharp),
            trailing: Container(
              height: 28,
              width: 60,
                          decoration:  BoxDecoration(
                            color:AppColors.darkGreyColor,
                            // color:merchant.admin?.status==1?Colors.green:AppColors.darkGreyColor,
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                            child: Row(
                              children: [
                                Text(
                                  // merchant.admin?.status==1?"  Active":
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
}
