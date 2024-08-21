import 'package:e_courier_360/presentation/state_holders/delivery_status_controller.dart';
import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/order_tracking/order_tracking_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/input_card.dart';
import 'package:e_courier_360/presentation/ui/widgets/home/parcel_dashbord.dart';

import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/quick_config.dart';

//This is Base Home screen which used for all panel
class BaseHomeScreen extends StatelessWidget {
  const BaseHomeScreen({super.key, required this.bottomChild});
  final Widget? bottomChild;

  @override
  Widget build(BuildContext context) {
    String? voucherId;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header section
            Container(
              height: 175,
              width: double.infinity,
              color: AppColors.primaryColor,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            QuickConfig.appName,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: AppColors.whiteColor),
                          ),
                        ),
                        // tracking input field
                                            Padding(
                     padding: const EdgeInsets.only(top: 16,right: 16,left: 16),
                     child: InputCard(child: TextField(
                      decoration: InputDecoration(
                      hintText: 'Enter tracking number',
                      suffixIcon: GetBuilder<ParcelController>(
                        builder: (parcelController) {
                          return Visibility(
                            visible:!parcelController.inProgress,
                            replacement: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            ),
                            child: Container(
                              decoration:primaryDecoration(context),
                              // color: AppColors.primaryColor,
                              child: IconButton(
                                onPressed: ()async{
                                  if(voucherId!=null && voucherId!.length>5){
                                    final bool response=await parcelController.trackingParcel(voucherId!);
                                    if(response){
                                    Get.to(const OrderTrackingScreen());
                                    }
                                  }
                                },
                                icon: const Icon(
                                Icons.search_rounded,
                                size: 30,color: AppColors.primaryColor,
                                 ),
                              ),
                            ),
                          );
                        }
                      )),
                      onChanged: (value) {
                         voucherId=value;
                      },
                        ),),
                   ),
                      ]),
                ),
              ),
            ),
            //parcels summary
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Parcels Summary',
                      style: TextStyle(
                          fontFamily: FontFamily.popins,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  AppSizedBox.h10,
                  GetBuilder<DeliveryStatusController>(
                      builder: (dashBoardController) {
                    return Visibility(
                      visible: dashBoardController.deliveryStatuses.isEmpty||
                          !dashBoardController.inProgress,
                      replacement: const CenterCircularProgressIndicator(),
                      child: ParcelDashBoard(
                        dashBoardController: dashBoardController,
                      ),
                    );
                  }),
                  bottomChild ?? Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
