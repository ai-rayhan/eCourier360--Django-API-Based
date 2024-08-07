import 'package:e_courier_360/data/models/rider.dart';
import 'package:e_courier_360/presentation/state_holders/rider_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/riders_screen/rider_details_screen.dart';
import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/utility/box_decoration.dart';
import 'package:e_courier_360/presentation/utility/text_style.dart';
import 'package:get/get.dart';


class RiderSummuryCard extends StatelessWidget {
  const RiderSummuryCard({
    super.key, required this.rider,
  });
final Rider rider;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RiderController>(
      builder: (controller) {
        return GestureDetector(
            onLongPress: () {
                controller.updateRiderId(rider.id);
              },
              onTap: (){
                 if(controller.riderIDList.isEmpty){
                 Get.to( RiderDetailsScreen(rider:rider));
                 }else{
                   controller.updateRiderId(rider.id);
                 }
        
                 },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration:controller.riderIDList.contains(rider.id)?AppBoxDecoration.whiteBlueDecoration:AppBoxDecoration.whiteDecoration,
              // height: 70,
              width: double.infinity,
              child: ListTile(
                title: Text(
                  rider.fullName,
                  style: AppTextStyle.theme16w600,
                ),
                subtitle: Text(
                 'Phone: ${rider.phone}\nEmail:${rider.email}\nVehicle:${rider.vehicleType}',
                  style: AppTextStyle.darkgrey13,
                ),
                leading: const Icon(Icons.account_circle_sharp),
                 trailing: Container(
                  height: 28,
                  width: 60,
                  decoration:  BoxDecoration(
                    color: rider.status=='0'?AppColors.darkGreyColor:Colors.green,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                    child: Row(
                      children: [
                        // Icon(Icons.update_sharp,size: 20,color: AppColors.whiteColor),
                        // const SizedBox(width: 2),
                        Text(rider.status=='0'?"Pending":"  Active",
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
