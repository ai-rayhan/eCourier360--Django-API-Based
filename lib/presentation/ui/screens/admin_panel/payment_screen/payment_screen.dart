import 'package:e_courier_360/presentation/ui/screens/admin_panel/payment_screen/payable_parcel_list.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_tabbar.dart';

class AdminPaymentScreen extends StatefulWidget {
  const AdminPaymentScreen({super.key});

  @override
  AdminPaymentScreenState createState() => AdminPaymentScreenState();
}

class AdminPaymentScreenState extends State<AdminPaymentScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['Merchant Payment', 'Rider Payment']; 

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CourierAppBar(title: "Payment",
      bottom: CustomTabBar(tabController: _tabController, tabs: _tabs),),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((String tab) {
          return  Center(child: ParcelList(deliveryStatusIdList: const[8,9],tabId: _tabs.indexOf(tab),));
        }).toList(),
      ),
    );
  }
}
