import 'package:e_courier_360/presentation/ui/screens/admin_panel/payment_history_screen/payable_parcel_list.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_tabbar.dart';

class AdminPaymentHistoryScreen extends StatefulWidget {
  const AdminPaymentHistoryScreen({super.key});

  @override
  AdminPaymentHistoryScreenState createState() => AdminPaymentHistoryScreenState();
}

class AdminPaymentHistoryScreenState extends State<AdminPaymentHistoryScreen> with SingleTickerProviderStateMixin {
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
      appBar: CourierAppBar(title: "Payment History",
      bottom: CustomTabBar(tabController: _tabController, tabs: _tabs),),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((String tab) {
          return  Center(child: PaymentList(tabId: _tabs.indexOf(tab),));
        }).toList(),
      ),
    );
  }
}
