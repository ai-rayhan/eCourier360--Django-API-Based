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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CourierAppBar(title: "Merchant",
        leadingOnPressed: (){
          Get.find<MainBottomNavController>().backToHome();
        },
       ),
  
      body:Container()
      //  const MerchantList()

    );
  }
}
