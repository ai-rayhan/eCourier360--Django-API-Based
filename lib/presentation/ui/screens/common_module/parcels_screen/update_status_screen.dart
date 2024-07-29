
// import 'package:e_courier_360/presentation/ui/screens/common_module/parcels_screen/parcels_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:e_courier_360/presentation/state_holders/dashboard_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/update_status_controller.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/input_card.dart';
// import 'package:e_courier_360/presentation/utility/sizedbox.dart';
// class UpdateStatusScreen extends StatefulWidget {
//   const UpdateStatusScreen({super.key});

//   @override
//   State<UpdateStatusScreen> createState() => _UpdateStatusScreenState();
// }

// class _UpdateStatusScreenState extends State<UpdateStatusScreen> {
//   final DashBoardController dashBoardController = Get.find();
//   final ParcelController parcelController = Get.find();
//   final ParcelStatusController parcelSatusController = Get.find();

//   int? selectedIds, paymentTypeId;
//   double? paymentAmount;
//   int? pickupRider;
//   int? deliveryRider;
//   int? partialCash;
//   String? reason;
  
//  @override
//   void initState() {
//   dashBoardController.reduceDeliveryStatusForUpdate(parcelSatusController.selectedParcels.first.status!.id);
//     super.initState();
//   }
//   @override
//   void dispose() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       parcelSatusController.clearSelection();
//     });
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CourierAppBar(
//         title: "Update Status",
//         leadingOnPressed: () {
//           Get.back();
//         },
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: GetBuilder<ParcelStatusController>(
//             builder: (controller) {
//               return Column(
//                 children: [
//                   const HeaderText(title: "Parcel Status:"),
//                   InputCard(
//                     child: DropdownButtonFormField<String>(
//                       decoration: const InputDecoration(
//                         labelText: 'Parcel Status:',
//                       ),
//                       value:controller.selectedParcels.isNotEmpty? controller.selectedParcels.first.status?.status:null,
//                       items: dashBoardController.updateStatusNames.map((level) {
//                         return DropdownMenuItem<String>(
//                           value: level,
//                           child: Text(
//                             level,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         int selectedIndex = dashBoardController.updateStatusNames.indexOf(value!);
//                         controller.selectedStatusId = dashBoardController.updateStatusIds[selectedIndex];
//                       },
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please select Parcel Status:';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   AppSizedBox.h5,
//                   if (controller.selectedStatusId == 3 || controller.selectedStatusId == 5)
//                     Column(
//                       children: [
//                         const HeaderText(title: "Select Rider:"),
//                         InputCard(
//                           child: DropdownButtonFormField<String>(
//                             decoration: const InputDecoration(
//                               labelText: 'Rider',
//                               prefixIcon: Icon(Icons.apartment),
//                             ),
//                             value: parcelController.combinedRiders.isNotEmpty ? parcelController.combinedRiders.first : null,
//                             items: parcelController.combinedRiders.map((level) {
//                               return DropdownMenuItem<String>(
//                                 value: level,
//                                 child: Text(
//                                   level,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               );
//                             }).toList(),
//                             onChanged: (value) {
//                               int selectedIndex = parcelController.combinedRiders.indexOf(value!);
//                               deliveryRider = parcelController.riderIds[selectedIndex];
//                               pickupRider = parcelController.riderIds[selectedIndex];
//                             },
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please select Rider';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   AppSizedBox.h5,
//                   if (controller.selectedStatusId == 6 || controller.selectedStatusId == 7 || controller.selectedStatusId == 8 || controller.selectedStatusId == 10)
//                     Column(
//                       children: [
//                         const HeaderText(title: "Reason"),
//                         CustomInputField(
//                           hintText: "Reason",
//                           onChangedForm: (newValue) {
//                             reason = newValue;
//                           },
//                         ),
//                       ],
//                     ),
//                   if (controller.selectedStatusId == 8)
//                     Column(
//                       children: [
//                         const HeaderText(title: "Partial Cash Collection"),
//                         CustomInputField(
//                           hintText: "Partial Cash Collection",
//                           onChangedForm: (newValue) {
//                             partialCash = int.tryParse(newValue);
//                           },
//                         ),
//                       ],
//                     ),
                  
//                   AppSizedBox.h10,
//                   Visibility(
//                     visible: !controller.inProgress,
//                     replacement: const CircularProgressIndicator(),
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () async {
//                           bool response=false;
//                           if (controller.selectedStatusId == null) {
//                             return;
//                           }
                         
//                             response= await controller.updateStatusByBatch(
//                             pickupRider: pickupRider,
//                             deliveryRider: deliveryRider,
//                             partialCash: partialCash,
//                             reason: reason,
//                           );
                          
//                          if(response){
//                           Get.back();
//                           Get.find<DashBoardController>().getDashboardInfo();
//                           Get.off(const ParcelsTrackScreen());
                         
//                          }

//                         },
//                         child: const Text("Update Status"),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
