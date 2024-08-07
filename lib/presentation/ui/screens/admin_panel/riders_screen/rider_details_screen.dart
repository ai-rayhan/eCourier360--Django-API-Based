import 'package:e_courier_360/comming_soon_module/parcel_summary_screen.dart';
import 'package:e_courier_360/data/models/rider.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_tabbar.dart';
import 'package:e_courier_360/presentation/utility/box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';


class RiderDetailsScreen extends StatefulWidget {
  const RiderDetailsScreen({super.key, required this.rider});
  final Rider rider;
  @override
  RiderDetailsScreenState createState() => RiderDetailsScreenState();
}

class RiderDetailsScreenState extends State<RiderDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = [
    'Bussiness Information',
    // 'Credential',
    'Parcel Summury'
  ];

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
      appBar:  CourierAppBar(
        title: "Rider",
        bottom: CustomTabBar(tabController: _tabController, tabs: _tabs),
      ),
      body: 
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: TabBarView(
          controller: _tabController,
          children:  [
            // MerchantBussinessInfo(merchant: null,),
            // ParcelSummaryScreen(),

          ],
        ),
      ),
    );
  }
}

class ShopInfoScreen extends StatelessWidget {
  const ShopInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.whiteDecoration,
      child: const Column(
        children: [
          InfoRow(
            icon: Icons.business,
            title: 'Business Name',
            subtitle: 'App user',
          ),
          Divider(),
          InfoRow(
            icon: Icons.phone,
            title: 'Pickup Phone',
            subtitle: '0124983297',
          ),
          Divider(),
          InfoRow(
            icon: Icons.location_on,
            title: 'Business Address',
            subtitle: 'App@app.com',
          ),
          Divider(),
          InfoRow(
            icon: Icons.location_on,
            title: 'Pickup Address',
            subtitle: 'App@app.com',
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const InfoRow({super.key, required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle),
        ),
      ],
    );
  }
}