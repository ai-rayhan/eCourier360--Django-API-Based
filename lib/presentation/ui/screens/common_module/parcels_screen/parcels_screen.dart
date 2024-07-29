// import 'package:e_courier_360/presentation/state_holders/delivery_status_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_status_controller.dart';
import 'package:e_courier_360/presentation/state_holders/main_bottom_nav_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/update_status_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/parcels_screen/update_status_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel_screen/common/parcel_list.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParcelsTrackScreen extends StatefulWidget {
  const ParcelsTrackScreen({super.key});

  @override
  ParcelsTrackScreenState createState() => ParcelsTrackScreenState();
}

class ParcelsTrackScreenState extends State<ParcelsTrackScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = Get.find<DeliveryStatusController>().statusNames;
  final List<int> statusId = Get.find<DeliveryStatusController>().statusIds;



  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.index=Get.find<DeliveryStatusController>().tabindex;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CourierAppBar(
        title: "Parcels",
        leadingOnPressed: (){
          Get.find<MainBottomNavController>().backToHome();
        },
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
              child: GetBuilder<DeliveryStatusController>(
                builder: (context) {
                final List<int> tabCounts = Get.find<DeliveryStatusController>().statusCount;
                  return Row(
                    children: [
                      Text(_tabs[index],style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                      const SizedBox(width: 5,),
                      if (tabCounts[index] > 0)
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 17,
                            minHeight: 17,
                          ),
                          child: Text(
                            tabCounts[index].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  );
                }
              ),
            );
          }),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((String tab) {
          int index = _tabs.indexOf(tab);
          return  Center(child: ParcelList(deliveryStatusId:statusId[index] ,));
        }).toList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton:GetBuilder<ParcelStatusController>(
      //   builder: (parcelController) {
      //     return parcelController.isSelectionMode()?SizedBox(width: 200, child: FilledButton (onPressed: (){
      //       Get.to(const UpdateStatusScreen());
      //     }, child:const Text("Update Status"),)):Container();
      //   }
      // )
    );
  }
}
