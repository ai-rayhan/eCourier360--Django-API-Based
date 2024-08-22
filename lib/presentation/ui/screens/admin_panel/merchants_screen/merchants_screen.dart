import 'package:e_courier_360/presentation/state_holders/merchant_controller.dart';
import 'package:e_courier_360/presentation/state_holders/parcel_summary_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/merchants_screen/widgets/merchant_info_summury_card.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_dialog.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_dropdown.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/empty_data.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/input_card.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:flutter/material.dart';

class MerchantsScreen extends StatefulWidget {
  const MerchantsScreen({super.key});

  @override
  MerchantsScreenState createState() => MerchantsScreenState();
}

class MerchantsScreenState extends State<MerchantsScreen> with SingleTickerProviderStateMixin {
  List <String> statuses=['Pending','Active','Cancel'];
  @override
  void dispose() {
   Get.find<MerchantController>().merchantIDList.clear();
   Get.find<MerchantController>().selectedStatus=null;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CourierAppBar(title: "Merchant",
        leadingOnPressed: (){
          Get.find<MainBottomNavController>().backToHome();
        },
       ),
  
      body: const MerchantList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GetBuilder<MerchantController>(
        builder: (controller) {
          return controller.merchantIDList.isEmpty?Container():Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: 200,
              child: ElevatedButton(onPressed:(){
                showCustomDialog(
                  context: context, title: "Change Status",
                  content: InputCard(child:  CustomDropdownButton(
                    initialItem: 'Pending',items:statuses,
                    onChanged: (value) {
                      controller.selectedStatus=statuses.indexOf(value??'');
                    },
                    )),
                    onSubmitPressed: () {
                      controller.activateMerchant();
                    },
                );
              }, child: const Text("Change Status")),
            ),
          );
        }
      ),

    );
  }
}

class MerchantList extends StatefulWidget {
  const MerchantList({super.key});

  @override
  State<MerchantList> createState() => _MerchantListState();
}

class _MerchantListState extends State<MerchantList> {
MerchantController merchantController=Get.find();
   @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await merchantController.getAllMerchants();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<MerchantController>(
        builder: (controller) {
          if(controller.merchantList.isEmpty){
            return const EmptyDataPage(msg: "No Merchant available",);
          }
          return Visibility(
            visible: !controller.inProgress,
            replacement: const CenterCircularProgressIndicator(),
            child: ListView.builder(
                itemCount: controller.merchantList.length,
                itemBuilder: (context, index) => MerchantInfoSummuryCard(
                      merchant: controller.merchantList[index],
                    )),
          );
        }
      ),
    );
  }
}