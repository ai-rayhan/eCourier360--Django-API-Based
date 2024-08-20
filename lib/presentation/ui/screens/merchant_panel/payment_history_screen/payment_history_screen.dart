import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/merchant_panel/payment_history_screen/completed_payment_list.dart';
import 'package:e_courier_360/presentation/ui/screens/merchant_panel/payment_history_screen/pending_payment_list.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_tabbar.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/state_holders/payment_controller.dart';
import 'package:flutter/material.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  PaymentHistoryScreenState createState() => PaymentHistoryScreenState();
}

class PaymentHistoryScreenState extends State<PaymentHistoryScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  static const List<String> _tabs = ['Pending', 'Completed'];

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
        bottom: CustomTabBar(tabController:  _tabController, tabs: _tabs),
        ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((tab) {
          return Center(child: PaymentHistoryList(tabIndex: _tabs.indexOf(tab)));
        }).toList(),
      ),
    );
  }
}

class PaymentHistoryList extends StatefulWidget {
  final int tabIndex;

  const PaymentHistoryList({super.key, required this.tabIndex});

  @override
  State<PaymentHistoryList> createState() => _PaymentHistoryListState();
}

class _PaymentHistoryListState extends State<PaymentHistoryList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => fetchPaymentData());
  }

  Future<void> fetchPaymentData() async {
    final PaymentController paymentController = Get.find();
    final ParcelController parcelController = Get.find();

    if (widget.tabIndex == 0) {
      await parcelController.getParcelsByMultipleStatuses([8, 9]);
    } else if (widget.tabIndex == 1) {
      await paymentController.getMerchantPaymentList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.tabIndex == 0 ? const PendingPaymentListScreen():const CompletedListScreen() ;
  }
}


class PaymentListItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const PaymentListItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: appBoxDecoration(context),
        child: ListTile(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
