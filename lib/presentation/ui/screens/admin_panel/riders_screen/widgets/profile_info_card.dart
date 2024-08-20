import 'package:e_courier_360/data/models/rider.dart';
import 'package:e_courier_360/presentation/state_holders/rider_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/info_row.dart';
import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/utility/box_decoration.dart';
import 'package:get/get.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
   final Rider? rider =Get.find<RiderController>().riderDetails;
    return Container(
      decoration: appBoxDecoration(context),
      child:  Column(
        children: [
          InfoRow(
            icon: Icons.business,
            title: 'Business Name',
            subtitle:rider?.fullName??'Not Added',
          ),
          const Divider(),
          InfoRow(
            icon: Icons.phone,
            title: 'Pickup Phone',
            subtitle: rider?.phone??'Not Added',
          ),
          const Divider(),
          InfoRow(
            icon: Icons.location_on,
            title: 'Business Address',
            subtitle: rider?.address??'Not Added',
          ),
          const Divider(),
          InfoRow(
            icon: Icons.fire_truck,
            title: 'Vehicle Type',
            subtitle: rider?.vehicleType??'Not Added',
          ),
          const Divider(),
          InfoRow(
            icon: Icons.receipt_long_sharp,
            title: 'Registration Number',
            subtitle: rider?.registrationNumber??'Not Added',
          ),
        ],
      ),
    );
  }
}