import 'package:e_courier_360/presentation/state_holders/delivery_status_controller.dart';
import 'package:e_courier_360/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_courier_360/presentation/state_holders/rider_controller.dart';
import 'package:e_courier_360/presentation/state_holders/update_status_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/parcels/update_status_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel/common/parcel_list.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/empty_data.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:e_courier_360/routes/app_routes.dart';
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

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Get.find<DeliveryStatusController>().deliveryStatuses.isEmpty?
    
     Scaffold(
        appBar: CourierAppBar(
        title: "Parcels",
        leadingOnPressed: (){
          Get.find<MainBottomNavController>().backToHome();
        },),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptyDataPage(msg: "You Haven't added any parcel\nAdd new parcel and view details here",msgStyle: AppTextStyle.darkGrey13Bold,),
          ElevatedButton.icon(onPressed: (){
            Get.find<MainBottomNavController>().changePage(0);
            Get.toNamed(RoutePath.adminHome);
          }, label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
            child: Text("Start Adding New parcel",style:AppTextStyle.theme16w600 ,),
          ))
          ],
      )): Scaffold(
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
          return  Center(child: ParcelList(deliveryStatusId:statusId[index]));
        }).toList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:GetBuilder<ParcelStatusController>(
        builder: (parcelController) {
          return parcelController.isSelectionMode()?SizedBox(width: 200, child: FilledButton (onPressed: (){
            Get.lazyPut<RiderController>(() => RiderController());
            Get.to(const UpdateStatusScreen());
          }, child:const Text("Update Status"),)):Container();
        }
      )
    );
  }
}
