
// import 'package:e_courier_360/data/models/body/booking.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:e_courier_360/presentation/state_holders/dashboard_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/merchant_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/update_status_controller.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/input_card.dart';
// import 'package:e_courier_360/presentation/utility/sizedbox.dart';
// class MakePaymentScreen extends StatefulWidget {
//   const MakePaymentScreen({super.key});

//   @override
//   State<MakePaymentScreen> createState() => _MakePaymentScreenState();
// }

// class _MakePaymentScreenState extends State<MakePaymentScreen> {
//   final DashBoardController dashBoardController = Get.find();
//   final ParcelController parcelController = Get.find();
//   final ParcelStatusController parcelSatusController = Get.find();

//   int? selectedIds, paymentTypeId;
//   double? paymentAmount;
//   double bookingAmount = 0;
//   String status = 'Pending';
//   int? merchantID;
//   int? riderPaymentMethod;

//   double getNumber() {
//     bookingAmount = 0; 
//     for (Booking parcel in parcelSatusController.selectedParcels) {
//       bookingAmount += parcel.cashCollection - parcel.deliveryCharge;
//       status = parcel.status?.status ?? 'Pending';
//       merchantID = parcel.merchentId;
//     }
//     return bookingAmount;
//   }
//  @override
//   void initState() {
//   dashBoardController.reduceDeliveryStatusForUpdate(parcelSatusController.selectedParcels.first.status!.id);
//     super.initState();
//   }
// List <String> statuses=['Deliverd',"Payment Settled"];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CourierAppBar(
//         title: parcelSatusController.paymentTabID==1?"Make Rider Payment":"Make Merchant Payment",
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
//                       value: controller.selectedParcels.first.status?.status,
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
//                         if (controller.selectedStatusId == 13) {
//                           Get.find<MerchantProfileController>().merchantProfile(controller.selectedParcels.first.merchentId);
//                         }
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
//                   if (controller.selectedStatusId ==13  && controller.paymentTabID==0)
//                   merchantPayment(),
//                   if (controller.selectedStatusId ==13  && controller.paymentTabID==1)
//                   riderPayment(),

//                   AppSizedBox.h10,
//                   Visibility(
//                     visible: !controller.inProgress,
//                     replacement: const CircularProgressIndicator(),
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () async {
//                              bool response=false;
//                           if (controller.selectedStatusId == null) {
//                             return;
//                           }
                         
//                           if (controller.selectedStatusId == 13) {
//                            if(controller.paymentTabID==0){
//                              response=await controller.makeMerchantPayment(
//                               paymentMethod: paymentTypeId == 1 ? "Bank" : "Mobile Banking",
//                               amount: paymentAmount,
//                             );
//                            }else if(controller.paymentTabID==1){
//                             response=await controller.makeRiderPayment(
//                               paymentMethod: paymentTypeId == 1 ? "Bank" : "Mobile Banking",
//                             );
//                            }
//                           }
//                              if(response){
//                              Get.back();
//                              Get.back();
                  
                         
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
//   List<String> paymentMethod=["Bank", "Mobile Banking"];
// riderPayment(){
//   return InputCard(
//        child: DropdownButtonFormField<String>(
//          decoration: const InputDecoration(
//            labelText: 'Payment type',
//            prefixIcon: Icon(Icons.apartment),
//          ),
//          items: paymentMethod.map((level) {
//            return DropdownMenuItem<String>(
//              value: level,
//              child: Text(
//                level,
//                overflow: TextOverflow.ellipsis,
//              ),
//            );
//          }).toList(),
//          onChanged: (value) {
//           riderPaymentMethod=paymentMethod.indexOf(value!);
//          },
//          validator: (value) {
//            if (value == null || value.isEmpty) {
//              return 'Please select Payment type';
//            }
//            return null;
//          },
//        ),
//      );
// }
//   GetBuilder<MerchantProfileController> merchantPayment() {
//     return GetBuilder<MerchantProfileController>(builder: (mcController) {
//                     return Column(
//                       children: [
//                         const HeaderText(title: "Select Payment Type:"),
//                         InputCard(
//                           child: DropdownButtonFormField<String>(
//                             decoration: const InputDecoration(
//                               labelText: 'Payment Type',
//                               prefixIcon: Icon(Icons.apartment),
//                             ),
//                             value:paymentMethod[0],
//                             items: paymentMethod.map((level) {
//                               return DropdownMenuItem<String>(
//                                 value: level,
//                                 child: Text(
//                                   level,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               );
//                             }).toList(),
//                             onChanged: (value) {
//                             paymentTypeId=paymentMethod.indexOf(value!);
//                               setState(() {});
//                             },
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please select Payment Type';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const HeaderText(title: "Select Payment Method Name:"),
//                         if (paymentTypeId != null)
//                           InputCard(
//                             child: DropdownButtonFormField<String>(
//                               decoration:  InputDecoration(
//                                 labelText: paymentTypeId == 0
//                                   ? mcController.merchantPGateway!.data.bankInfo.isNotEmpty?
//                                    'Payment Method Name':"Not Bank Info Available":mcController.merchantPGateway!.data.mobileInfo.isNotEmpty?'Payment Method Name':"Not Mobile Info Available",
//                                 prefixIcon: const Icon(Icons.payment),
//                               ),
//                               value: paymentTypeId == 0
//                                   ? (mcController.merchantPGateway!.data.bankInfo.isNotEmpty
//                                       ? mcController.merchantPGateway!.data.bankInfo.first.bankName
//                                       : null)
//                                   : (mcController.merchantPGateway!.data.mobileInfo.isNotEmpty
//                                       ? mcController.merchantPGateway!.data.mobileInfo.first.bankName
//                                       : null),
//                               items: paymentTypeId == 0
//                                   ? mcController.merchantPGateway!.data.bankInfo.map((level) {
//                                       return DropdownMenuItem<String>(
//                                         value: level.bankName,
//                                         child: Text(
//                                           level.bankName,
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                       );
//                                     }).toList()
//                                   : mcController.merchantPGateway!.data.mobileInfo.map((level) {
//                                       return DropdownMenuItem<String>(
//                                         value: level.bankName,
//                                         child: Text(
//                                           level.bankName,
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                       );
//                                     }).toList(),
//                               onChanged: (value) {
//                                 setState(() {});
//                               },
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please select Payment Method Name';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         const HeaderText(title: "Partial Cash Collection"),
//                         CustomInputField(
//                           hintText: "Amount",
//                           onChangedForm: (newValue) {
//                             paymentAmount = double.tryParse(newValue);
//                           },
//                           initialValue: getNumber().toStringAsFixed(2),
//                         ),
//                       ],
//                     );
//                   });
//   }
// }
