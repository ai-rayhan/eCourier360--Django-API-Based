import 'package:e_courier_360/data/models/receiver.dart';
import 'package:e_courier_360/presentation/state_holders/receiver_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/merchant_panel/profile_screen/add_receiver_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_dialog.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_popup_menu.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
class ReceiversScreen extends StatefulWidget {
  const ReceiversScreen({super.key});

  @override
  ReceiversScreenState createState() => ReceiversScreenState();
}

class ReceiversScreenState extends State<ReceiversScreen> with SingleTickerProviderStateMixin {
  List <String> statuses=['Update','Delete'];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<ReceiverController>().getReceivers();
    });
    super.initState();
  }
  @override
  void dispose() {
   Get.find<ReceiverController>().receiverIDList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CourierAppBar(title: "Receivers",),
      body: const Center(child: ReceiverList()),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GetBuilder<ReceiverController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: 200,
              child: ElevatedButton(onPressed:(){
                if(controller.receiverIDList.isNotEmpty){
                  showInputDialog(
                  context: context, title: "Delete Receiver",
                  content: const Text("Are you sure to delete this receiver"),
                    onSubmitPressed: () {
                      controller.deleteReceivers();
                    },
                );
                }else{
                  Get.to(const AddReceiverScreen());
                }

              }, child:  Text(controller.receiverIDList.isNotEmpty?"Delete Receiver":"Add Receiver")),
            ),
          );
        }
      ),
    );
  }
}


class ReceiverList extends StatefulWidget {
  const ReceiverList({super.key});

  @override
  State<ReceiverList> createState() => _ReceiverListState();
}

class _ReceiverListState extends State<ReceiverList> {
  final ReceiverController riderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReceiverController>(builder: (controller) {
      return Visibility(
        visible: !controller.inProgress,
        replacement: const CenterCircularProgressIndicator(),
        child: ListView.builder(
            itemCount: controller.receivers.length,
            itemBuilder: (context, index) =>ReceiverSummuryCard(receiver: controller.receivers[index],))
      );
    });
  }
}

class ReceiverSummuryCard extends StatelessWidget {
  const ReceiverSummuryCard({
    super.key, required this.receiver,
  });
final Receiver receiver;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReceiverController>(
      builder: (controller) {
        return GestureDetector(
            onLongPress: () {
                controller.updateReceiverId(receiver.id);
              },
              onTap: (){
                if(controller.receiverIDList.isNotEmpty){
                  controller.updateReceiverId(receiver.id);
                }
              },
            
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration:controller.receiverIDList.contains(receiver.id)?AppBoxDecoration.whiteBlueDecoration:AppBoxDecoration.whiteDecoration,
              // height: 70,
              width: double.infinity,
              child: ListTile(
                title: Text(
                  receiver.name,
                  style: AppTextStyle.theme16w600,
                ),
                subtitle: Text(
                 'Phone: ${receiver.phone}\nEmail:${receiver.email}',
                  style: AppTextStyle.darkgrey13,
                ),
                leading: const Icon(Icons.account_circle_sharp),
                trailing: CustomPopupMenuButton(menuItems: [
                  PopupMenuItem(
                    value: 0,
                    child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.edit,color:AppColors.primaryColor,),
                      ),
                      Text('Update',style: Theme.of(context).textTheme.titleMedium,),
                    ],
                  )),
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                    children: [
                       const Padding(
                         padding: EdgeInsets.all(8.0),
                         child: Icon(Icons.delete,color:Colors.red,),
                       ),
                      Text('Delete',style: Theme.of(context).textTheme.titleMedium,),
                    ],
                  )),
                ],icon: Icons.more_vert,onSelected: (val){
            
                  if(val==1){
                    controller.updateReceiverId(receiver.id);
                    showInputDialog(
                  context: context, title: "Delete Receiver",
                  content: const Text("Are you sure to delete this receiver"),
                    onSubmitPressed: () {
                      controller.deleteReceivers();
                    },
                );
                  }else{

                  }
                },),
              ),
            ),
          ),
        );
      }
    );
  }
}

// class CustomListTileCard extends StatelessWidget {
//   const CustomListTileCard({
//     super.key, required this.title,required this.subtitle
//   });
// final String title;
// final String subtitle;
// final VoidCallback?onLongPress;
// final VoidCallback?onTap;
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<RiderController>(
//       builder: (controller) {
//         return GestureDetector(
//             onLongPress: () {
//                 controller.updateRiderId(rider.id);
//               },
//               onTap: (){
//                  if(controller.riderIDList.isEmpty){
//                  Get.to( RiderDetailsScreen(rider:rider));
//                  }else{
//                    controller.updateRiderId(rider.id);
//                  }
        
//                  },
//           child: Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Container(
//               decoration:controller.riderIDList.contains(rider.id)?AppBoxDecoration.whiteBlueDecoration:AppBoxDecoration.whiteDecoration,
//               // height: 70,
//               width: double.infinity,
//               child: ListTile(
//                 title: Text(
//                   rider.fullName,
//                   style: AppTextStyle.theme16w600,
//                 ),
//                 subtitle: Text(
//                  'Phone: ${rider.phone}\nEmail:${rider.email}\nVehicle:${rider.vehicleType}',
//                   style: AppTextStyle.darkgrey13,
//                 ),
//                 leading: const Icon(Icons.account_circle_sharp),
//                  trailing: Container(
//                   height: 28,
//                   width: 60,
//                   decoration:  BoxDecoration(
//                     color: rider.status=='0'?AppColors.darkGreyColor:Colors.green,
//                     borderRadius: const BorderRadius.all(Radius.circular(12)),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
//                     child: Row(
//                       children: [
//                         // Icon(Icons.update_sharp,size: 20,color: AppColors.whiteColor),
//                         // const SizedBox(width: 2),
//                         Text(rider.status=='0'?"Pending":"  Active",
//                           style: const TextStyle(fontSize: 13,color: AppColors.whiteColor),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       }
//     );
//   }
// }
