import 'package:e_courier_360/data/helper/string_converter.dart';
import 'package:e_courier_360/data/models/rider.dart';
import 'package:e_courier_360/presentation/state_holders/rider_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/merchants_screen/merchant_details_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/riders_screen/widgets/profile_info_card.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_tabbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/empty_data.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
import 'package:e_courier_360/presentation/utility/box_decoration.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:get/get.dart';


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
    'Profile Information',
    'Parcel Summury'
  ];

  @override
  void initState() {
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<RiderController>().getRiderDetails(widget.rider.id);
    });
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
            const RiderBussinessInfo(),
            const ParcelSummaryScreen(),
          ],
        ),
      ),
    );
  }
}

class RiderBussinessInfo extends StatelessWidget {
  const RiderBussinessInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GetBuilder<RiderController>(
          builder: (controller) {
          Rider?  rider=controller.riderDetails;
            return Visibility(
              visible: controller.riderDetails!=null,
              replacement: const EmptyDataPage(),
              child: Column(
                children: [
                  AppSizedBox.h16,
                   CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.purple,
                    child: Text(
                     getFirstCharactersOfWords(rider?.fullName??"Empty"),
                      style: const TextStyle(fontSize: 24.0, color: Colors.white),
                    ),
                  ),
                  AppSizedBox.h10,
                   Text(
                    rider?.userdetails?.username??"",
                    style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  AppSizedBox.h16,
                  const HeaderText(title: "Bussiness Information:"),
                   const ProfileInfoScreen(),
                  AppSizedBox.h16,
                  const HeaderText(title: "Bank Information:"),
                  rider?.bankInformation!=null? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: rider!.bankInformation!.map((bankInfo) {
                      return Container(
                        decoration: AppBoxDecoration.whiteDecoration,
                        child: ListTile(
                          title: Text( "Bank Name :${bankInfo.bankName}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          subtitle: Text("Acc.No:${bankInfo.accountNumber}  Branch:${bankInfo.branch}"),
                        ),
                      );
                    }).toList(),
                  ):const Center(child:  Text("No Bank Information Added"),),
                  
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
