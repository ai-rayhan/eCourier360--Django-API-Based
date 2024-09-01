import 'package:e_courier_360/presentation/state_holders/payment_controller.dart';
import 'package:e_courier_360/presentation/ui/base/base_home_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/merchant_panel/payment_history_screen/payment_history_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/home/home_option_card.dart';
import 'package:e_courier_360/presentation/ui/widgets/home/support_card.dart';
import 'package:e_courier_360/presentation/utility/size.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:e_courier_360/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class MerchantHomeScreen extends StatelessWidget {
  const MerchantHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseHomeScreen(bottomChild: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       AppSizedBox.h10,
       Text('Let\'s do ',style: TextStyle(fontFamily: FontFamily.popins,fontSize: 18,fontWeight: FontWeight.w500)),
         AppSizedBox.h10,
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                               
                      HomeOptionCard(
                        height: 90,
                        width: Sizefinder.deviceWidth(context)/2.4,
                        title: 'Send Parcel',
                        imagePath: HugeIcons.strokeRoundedPackageAdd, 
                        onTap: () {
                         Get.toNamed(RoutePath.sendParcel);
                        },
                      ),
                      AppSizedBox.w16,
                      HomeOptionCard(
                        height: 90,
                        width: Sizefinder.deviceWidth(context)/2.4,
                        title: 'Payment History',
                        imagePath:Icons.payments_rounded, 
                        onTap: () {
                        Get.lazyPut<PaymentController>(() => PaymentController());
                        Get.to(const PaymentHistoryScreen());
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const SupportCard()
              ],
            ),
    ],));
  }
}
