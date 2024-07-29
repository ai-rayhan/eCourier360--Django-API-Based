import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';

class RiderPaymentHistoryScreen extends StatefulWidget {
  const RiderPaymentHistoryScreen({super.key});

  @override
  RiderPaymentHistoryScreenState createState() => RiderPaymentHistoryScreenState();
}

class RiderPaymentHistoryScreenState extends State<RiderPaymentHistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['Paid', 'Processing', 'Unpaid']; 

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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Payment History",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        bottom: TabBar(
          indicatorColor: AppColors.secondaryColor,
          indicatorWeight: 6,
          isScrollable: true,
          labelStyle:const TextStyle(color: Colors.white),
          labelColor: AppColors.secondaryColor,
          unselectedLabelStyle: const TextStyle(color: Color(0x94FFFFFF)),
          controller: _tabController,
          tabs: List.generate(_tabs.length, (index) {
            return Tab(
              child: Text(_tabs[index],style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
            );
          }),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((String tab) {
          return const Center(child: PaymentHistoryList());
        }).toList(),
      ),
    );
  }
}
class PaymentHistoryList extends StatefulWidget {
  const PaymentHistoryList({super.key});

  @override
  State<PaymentHistoryList> createState() => _PaymentHistoryListState();
}

class _PaymentHistoryListState extends State<PaymentHistoryList> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: 4,
      itemBuilder: (context,index)=>Container()
      // PaymentHistoryCard(shipment: shipmentController.shipment[index])
      );
  }
}