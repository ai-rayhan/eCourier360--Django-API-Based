
import 'package:e_courier_360/data/helper/date_converter.dart';
import 'package:e_courier_360/data/models/parcel.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_status_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/parcels_screen/percel_view_screen.dart';
import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:e_courier_360/presentation/utility/box_decoration.dart';
import 'package:e_courier_360/presentation/utility/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/state_holders/update_status_controller.dart';
import 'package:e_courier_360/presentation/utility/status_icon.dart';


class TrackingCard extends StatelessWidget {
  const TrackingCard({super.key, required this.parcel});
  final Parcel parcel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ParcelStatusController>(
      builder: (controller) {
        bool isSelected = controller.isSelected(parcel);

        return InkWell(
          onTap: () {
            if (controller.isSelectionMode()) {
              controller.toggleSelection(parcel);
            } else {
              Get.to(PercelViewScreen(parcelData: parcel));
            }
          },
          onLongPress: () {
            if ((AuthController.userRole == 1||AuthController.userRole == 2) &&
                parcel.deliveryStatus < 8) {
              controller.toggleSelection(parcel);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Container(
              height: 135,
              width: double.infinity,
              decoration: isSelected
                  ? BoxDecoration(
                      color: AppColors.secondaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.secondaryColor),
                    )
                  : AppBoxDecoration.whiteDecoration,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipment Number',
                                style: AppTextStyle.primary14w600),
                            Text(parcel.voucherId,
                                style: AppTextStyle.darkGrey14Bold),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffF0E4E1),
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Image.network(height: 20,width: 20, "${Urls.siteUrl}${Get.find<DeliveryStatusController>().deliveryStatus(parcel.deliveryStatus).image}"),
                                    // Icon(statusIcons[parcel.deliveryStatus - 1],size: 15,color: colors[parcel.deliveryStatus-1],),
                                    const SizedBox(width: 2),
                                    Text(
                                      '',
                                      // Get.find<DeliveryStatusController>().deliveryStatus(parcel.deliveryStatus).status,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  children: [
                                    const Text("Payment:",style: TextStyle(fontSize: 10)),
                                    Row(
                                      children: [
                                        const SizedBox(width: 2),
                                        const Text("Merchant",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      if( parcel.paymentStatus==1)
                                       const Icon(Icons.cancel_outlined,size: 13,color: Colors.red,),
                                      if( parcel.paymentStatus==2)
                                       const Icon(Icons.check_circle_outline_sharp,size: 13,color: Colors.green,),
                                      ],
                                    ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 2),
                                          const Text("Rider",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        if( parcel.driverPaymentStatus==1)
                                       const Icon(Icons.cancel_outlined,size: 13,color: Colors.red,),
                                        if( parcel.driverPaymentStatus==2)
                                       const Icon(Icons.check_circle_outline_sharp,size: 13,color: Colors.green,),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      
                        
                     
                      ],
                    ),
                    
                    const Divider(height: 3),
                    Text(
                      "Sending To: ${parcel.deliveryAddress}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: FontFamily.popins,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const SizedBox(width: 5),
                        Text(
                          "৳ ${parcel.cashCollection}",
                          style: TextStyle(
                            fontFamily: FontFamily.popins,
                            fontSize: 16,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const CircleAvatar(radius: 4),
                        const SizedBox(width: 5),
                        Text(
                          DateConverter.charMonthDDYYY(parcel.createdAt),
                          style: AppTextStyle.darkGrey13Bold,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
