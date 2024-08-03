
import 'package:e_courier_360/data/models/receiver.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/empty_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/data/helper/url_launcher.dart';
import 'package:e_courier_360/presentation/state_holders/receiver_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:e_courier_360/presentation/utility/text_style.dart';

class CustomerAddressScreen extends StatefulWidget {
  const CustomerAddressScreen({super.key});

  @override
  State<CustomerAddressScreen> createState() => _CustomerAddressScreenState();
}

class _CustomerAddressScreenState extends State<CustomerAddressScreen> {
    @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<ReceiverController>().getReceivers();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Customer Address Book",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
        ),
        body: GetBuilder<ReceiverController>(
          builder: (controller) {
            return Visibility(
              visible: controller.inProgress,
              replacement: Visibility(
                visible: controller.receivers.isNotEmpty,
                replacement: const EmptyDataPage(msg: "No Customer Address found",),
                child: ListView.builder(
                  itemCount:controller.receivers.length,
                  itemBuilder: (context,index)=>CustomerInfoCard(receiver: controller.receivers[index],index: index+1,)),
              ),
              child: const CenterCircularProgressIndicator(),
            );
          }
        ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: GestureDetector(
      //      onTap: () => Get.to(const AddReceiverScreen()),
      //     child: Container(
      //       decoration: AppBoxDecoration.whiteBlueDecoration.copyWith(color: AppColors.secondaryColor),
      //       child: Padding(
      //         padding: const EdgeInsets.all(10.0),
      //         child: Row(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [const Icon(Icons.add,color: Colors.white),Text("Add Shop",style: AppTextStyle.grey14.copyWith(color: Colors.white),)],),
      //       ),
      //     ),
      //   ),
      //   // ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text("Add Shop")),
      // ),
    );
  }
}

class CustomerInfoCard extends StatelessWidget {
  const CustomerInfoCard({
    super.key, required this.receiver, required this.index,
  });
final Receiver receiver;
final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundColor: AppColors.lightPrimaryColor,child: Text(index.toString(),style: AppTextStyle.grey14.copyWith(color: Colors.white),),),
        title: Text("Name:${receiver.name}"),
        subtitle: Text("Address:${receiver.address}\nPhone number: ${receiver.phone}\nEmail:${receiver.email}"),
        trailing: IconButton(onPressed: (){
          AppUrlLauncher.makePhoneCall(receiver.phone);
        }, icon: const CircleAvatar(child: Icon(Icons.call,color: AppColors.primaryColor,))),
      ),
    );
  }
}