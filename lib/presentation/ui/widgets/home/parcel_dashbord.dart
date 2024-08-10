import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_status_controller.dart';
import 'package:e_courier_360/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/home/delivery_status_card.dart';
import 'package:e_courier_360/presentation/utility/status_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
class ParcelDashBoard extends StatelessWidget {
  const ParcelDashBoard({
    super.key,
    required this.dashBoardController,
  });
  final DeliveryStatusController dashBoardController;
  @override
  Widget build(BuildContext context) {
    String url="http://10.0.2.2:8000";
    return Skeletonizer(
      enabled: dashBoardController.inProgress,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        // itemCount: 6,
        itemCount:
            dashBoardController.deliveryStatuses.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              dashBoardController.tabIndex = index;
              if(AuthController.userRole==4){
                 Get.find<MainBottomNavController>().changeIndex(1);
              }else{
                  Get.find<MainBottomNavController>().changeIndex(2);
              }
            },
            child: SummaryCard(
              status: dashBoardController.deliveryStatuses[index].status,
              count: dashBoardController
                  .deliveryStatuses[index].parcelCount
                  .toString(),
              countColor: colors[dashBoardController
                  .deliveryStatuses[index].id-1],
              image:"$url/${dashBoardController.deliveryStatuses[index].image}"
              //  Icon(statusIcons[dashBoardController
              //     .deliveryStatuses[index].id-1],size: 40,color: colors[dashBoardController
              //     .deliveryStatuses[index].id-1]),
            ),
          );
        },
      ),
    );
  }
}
