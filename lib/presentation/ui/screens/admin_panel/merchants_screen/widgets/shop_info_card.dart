import 'package:e_courier_360/data/models/merchant.dart';
import 'package:e_courier_360/presentation/state_holders/merchant_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/info_row.dart';
import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/utility/box_decoration.dart';
import 'package:get/get.dart';
class ShopInfoScreen extends StatelessWidget {
  const ShopInfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
   final Merchant? merchant= Get.find<MerchantController>().merchantDetails;
    return Container(
      decoration: appBoxDecoration(context),
      child:  Column(
        children: [
          InfoRow(
            icon: Icons.business,
            title: 'Business Name',
            subtitle:merchant?.shopName??"Not added",
          ),
          Divider(),
          InfoRow(
            icon: Icons.phone,
            title: 'Pickup Phone',
            subtitle: merchant?.pickupPhone??"Not added",
          ),
          Divider(),
          InfoRow(
            icon: Icons.location_on,
            title: 'Business Address',
            subtitle: merchant?.shopAddress??"Not added",
          ),
          Divider(),
          InfoRow(
            icon: Icons.location_on,
            title: 'Pickup Address',
            subtitle: merchant?.pickupAddress??"Not added",
          ),
        ],
      ),
    );
  }
}