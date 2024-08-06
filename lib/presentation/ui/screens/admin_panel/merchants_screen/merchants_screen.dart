import 'package:e_courier_360/presentation/state_holders/merchant_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_dialog.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_dropdown.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/input_card.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/merchants_screen/merchant_list_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:flutter/material.dart';

class MerchantsScreen extends StatefulWidget {
  const MerchantsScreen({super.key});

  @override
  MerchantsScreenState createState() => MerchantsScreenState();
}

class MerchantsScreenState extends State<MerchantsScreen> with SingleTickerProviderStateMixin {
  List <String> statuses=['In Active','Active','Cancel'];
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
      bottomNavigationBar: GetBuilder<MerchantController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(onPressed:(){
              showInputDialog(
                context: context, title: "Change Status",
                content: InputCard(child:  CustomDropdownButton(
                  initialItem: 'In Active',items:statuses,
                  onChanged: (value) {
                    controller.selectedStatus=statuses.indexOf(value??'');
                  },
                  )),
                  onSubmitPressed: () {
                    controller.activateMerchant();
                  },
              );
            }, child: const Text("Change Status")),
          );
        }
      ),

    );
  }
}
