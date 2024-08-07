import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_dialog.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_dropdown.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/input_card.dart';
import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/riders_screen/widgets/rider_summary_card.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/state_holders/rider_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
class RidersScreen extends StatefulWidget {
  const RidersScreen({super.key});

  @override
  RidersScreenState createState() => RidersScreenState();
}

class RidersScreenState extends State<RidersScreen> with SingleTickerProviderStateMixin {
  List <String> statuses=['Pending','Active','Cancel'];
  @override
  void dispose() {
   Get.find<RiderController>().riderIDList.clear();
   Get.find<RiderController>().selectedStatus=null;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CourierAppBar(title: "Riders",),
      body: Center(child: RiderList()),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GetBuilder<RiderController>(
        builder: (controller) {
          return controller.riderIDList.isEmpty?Container():Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: 200,
              child: ElevatedButton(onPressed:(){
                showInputDialog(
                  context: context, title: "Change Status",
                  content: InputCard(child:  CustomDropdownButton(
                    initialItem: 'Pending',items:statuses,
                    onChanged: (value) {
                      controller.selectedStatus=statuses.indexOf(value??'');
                    },
                    )),
                    onSubmitPressed: () {
                      controller.activateRider();
                    },
                );
              }, child: const Text("Change Status")),
            ),
          );
        }
      ),
    );
  }
}


class RiderList extends StatefulWidget {
  const RiderList({super.key});

  @override
  State<RiderList> createState() => _RiderListState();
}

class _RiderListState extends State<RiderList> {
  final RiderController riderController = Get.find();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await riderController.getAllRiders();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RiderController>(builder: (controller) {
      return Visibility(
        visible: !controller.inProgress,
        replacement: const CenterCircularProgressIndicator(),
        child: ListView.builder(
            itemCount: controller.riderList.length,
            itemBuilder: (context, index) => RiderSummuryCard(
                 rider: controller.riderList[index],
                
                )),
      );
    });
  }
}
