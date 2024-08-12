import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderTrackingScreen extends StatelessWidget {
  final String voucherId;

  const OrderTrackingScreen({super.key, required this.voucherId});

  @override
  Widget build(BuildContext context) {
    // final ParcelController controller = Get.find<ParcelController>();

    // // Fetch the tracking data when the screen loads
    // controller.trackingParcel(voucherId);

    return Scaffold(
      appBar: const CourierAppBar(title: "Tracking Parcel"),
      body: 
        // if (controller.parcelUpdateList.isEmpty) {
        //   return const Center(child: CircularProgressIndicator());
        // }

        // return
         GetBuilder<ParcelController>(
           builder: (controller) {
               if (controller.parcelUpdateList.isEmpty) {
               return const Center(child: CircularProgressIndicator());
             }

             return ListView.builder(
              itemCount: controller.parcelUpdateList.length,
              itemBuilder: (context, index) {
                final status = controller.parcelUpdateList[index];
             
                return TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  isFirst: index == 0,
                  isLast: index == controller.parcelUpdateList.length - 1,
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    indicatorXY: 0.5,
                    iconStyle: IconStyle(
                      iconData: _getIcon(status.status.activity),
                      color: Colors.white,
                    ),
                    color: _getColor(status.status.publish ? 'badge badge-success' : 'badge badge-light'),
                  ),
                  beforeLineStyle: LineStyle(
                    color: _getColor(status.status.publish ? 'badge badge-success' : 'badge badge-light'),
                    thickness: 6,
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              status.createdAt.toLocal().toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              getTimeAgo(status.createdAt.toString()),
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: _getColor(status.status.publish ? 'badge badge-success' : 'badge badge-light').withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                status.status.status,
                                style: TextStyle(
                                  color: _getColor(status.status.publish ? 'badge badge-success' : 'badge badge-light'),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(status.status.activity),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Spacer(),
                            Text(
                              'updated by ${status.createdBy}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
                     );
           }
         )
   
    );
  }

  IconData _getIcon(String icon) {
    // Adjusted to map your status activity or other identifiers to icons
    switch (icon) {
      case 'Admin accepted parcel':
        return Icons.check_circle;
      case 'Parcel Canceled':
        return Icons.cancel;
      default:
        return Icons.info;
    }
  }

  Color _getColor(String colorCode) {
    switch (colorCode) {
      case 'badge badge-light':
        return Colors.grey;
      case 'badge badge-warning':
        return Colors.orange;
      case 'badge badge-danger':
        return Colors.red;
      case 'badge badge-secondary':
        return Colors.blueGrey;
      case 'badge badge-success':
        return Colors.green;
      case 'badge badge-primary':
        return Colors.blue;
      default:
        return Colors.blue;
    }
  }

  String getTimeAgo(String createdAt) {
    final date = DateTime.parse(createdAt);
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inMinutes} minutes ago';
    }
  }
}
