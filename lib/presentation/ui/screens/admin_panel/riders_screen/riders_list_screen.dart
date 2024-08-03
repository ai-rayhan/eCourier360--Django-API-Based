import 'package:e_courier_360/presentation/ui/screens/admin_panel/riders_screen/rider_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/state_holders/rider_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:e_courier_360/presentation/utility/box_decoration.dart';
import 'package:e_courier_360/presentation/utility/text_style.dart';

class RiderList extends StatefulWidget {
  const RiderList({super.key});

  @override
  State<RiderList> createState() => _RiderListState();
}

class _RiderListState extends State<RiderList> {
  final RiderController riderController = Get.find();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await riderController.getAllRiders();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RiderController>(builder: (controller) {
      return Visibility(
        visible: !controller.inProgress,
        replacement: const CenterCircularProgressIndicator(),
        child: ListView.builder(
            itemCount: controller.riderList.length,
            itemBuilder: (context, index) => MerchantInfoSummuryCard(
                  id:  controller.riderList[index].id,
                  title:  controller.riderList[index].fullName,
                  subtitle: 'Phone: ${controller.riderList[index].phone}\nEmail:${controller.riderList[index].email}\nVehicle:${controller.riderList[index].vehicleType}',
                  onTap: () => Get.to( RiderDetailsScreen(rider:controller.riderList[index]  ,)),
                )),
      );
    });
  }
}

class MerchantInfoSummuryCard extends StatelessWidget {
  const MerchantInfoSummuryCard({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
  final int id;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
  int status=2;
  // Get.find<RiderController>().getStatus(id);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: AppBoxDecoration.whiteDecoration,
          // height: 70,
          width: double.infinity,
          child: ListTile(
            title: Text(
              title,
              style: AppTextStyle.theme16w600,
            ),
            subtitle: Text(
              subtitle,
              style: AppTextStyle.darkgrey13,
            ),
            leading: const Icon(Icons.account_circle_sharp),
             trailing: Container(
              height: 28,
              width: 60,
              decoration:  BoxDecoration(
                color: status==2?AppColors.darkGreyColor:Colors.green,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                child: Row(
                  children: [
                    // Icon(Icons.update_sharp,size: 20,color: AppColors.whiteColor),
                    // const SizedBox(width: 2),
                    Text(status==2?"Pending":"  Active",
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
