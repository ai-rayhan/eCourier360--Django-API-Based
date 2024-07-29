import 'dart:developer';

import 'package:e_courier_360/data/models/body/parcel_data.dart';
import 'package:e_courier_360/data/models/product.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_charge_info_controller.dart';
import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
import 'package:e_courier_360/presentation/state_holders/parcel_data_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/parcels_screen/parcels_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel_screen/common/product_listview.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
import 'package:e_courier_360/presentation/ui/widgets/parcel/parcel_view_txt.dart';
import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:e_courier_360/presentation/utility/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParcelPreviewScreen extends StatefulWidget {
  final List<Product> products;
  final int? parcelId;
  const ParcelPreviewScreen({Key? key, required this.products, this.parcelId})
      : super(key: key);

  @override
  State<ParcelPreviewScreen> createState() => _ParcelPreviewScreenState();
}

class _ParcelPreviewScreenState extends State<ParcelPreviewScreen> {
  final DeliveryTypeInfoController _deliveryChargeInfoController =
      Get.find<DeliveryTypeInfoController>();
  final ParcelDataController _parcelDataController =
      Get.find<ParcelDataController>();

  @override
  Widget build(BuildContext context) {
    //  final int deliveryTypeIndex=_deliveryChargeInfoController.deliveryTypes.where((dt) => dt.deliveryType==_parcelDataController.deliveryTypeValue).toList().first.id??0;
    final int deliveryTypeIndex = _deliveryChargeInfoController.deliveryTypes
        .indexWhere(
            (dt) => dt.deliveryType == _parcelDataController.deliveryTypeValue);
    log(deliveryTypeIndex.toString());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Confim Percel",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const HeaderText(title: "Percel Information:"),
                    const Divider(),
                    ParcelViewText(
                      prefix: 'Pickup Location: ',
                      text: _parcelDataController.pickupZoneValue ?? '',
                    ),
                    const SizedBox(height: 10),
                    ParcelViewText(
                      prefix: 'Name: ',
                      text: _parcelDataController.nameValue ?? '',
                    ),
                    const SizedBox(height: 10),
                    ParcelViewText(
                      prefix: 'Phone Number: ',
                      text: _parcelDataController.phoneNumberValue ?? '',
                    ),
                    const SizedBox(height: 10),
                    ParcelViewText(
                      prefix: 'Receiver Address: ',
                      text: _parcelDataController.receiverAddressValue ?? '',
                    ),
                    const SizedBox(height: 10),
                    ParcelViewText(
                      prefix: 'Delivery Area: ',
                      text: _parcelDataController.deliveryZoneValue ?? '',
                    ),
                    const SizedBox(height: 10),
                    ParcelViewText(
                      prefix: 'Merchant Invoice ID: ',
                      text: _parcelDataController.invoiceIdValue ?? '',
                    ),
                    const SizedBox(height: 10),
                    ParcelViewText(
                      prefix: 'Cash Money Amount: ',
                      text: _parcelDataController.cashAmountValue ?? '',
                    ),
                    const SizedBox(height: 10),
                    ParcelViewText(
                        prefix: 'Selling Price Amount: ',
                        text: _parcelDataController.sellingPriceValue ?? '',
                        style: AppTextStyle.darkGrey13Bold
                            .copyWith(color: AppColors.secondaryColor)),
                    ProductListView(
                      product: widget.products,
                    ),
                    const HeaderText(title: "Charges:"),
                    ParcelViewText(
                      prefix: 'Delivery Charges: ',
                      text: _deliveryChargeInfoController
                          .deliveryTypes[deliveryTypeIndex].basicCharge
                          .toString(),
                    ),
                    const SizedBox(height: 10),
                    ParcelViewText(
                      prefix: 'Service & COD Charges:',
                      text: _deliveryChargeInfoController.getTotalCharge(
                          widget.products,
                          deliveryTypeIndex,
                          _parcelDataController.cashAmountValue ?? ''),
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                            child: Text("Total:",
                                style: AppTextStyle.primary14w600)),
                        Expanded(
                            child: Text(
                                _deliveryChargeInfoController.totalCharge
                                    .toStringAsFixed(2),
                                textAlign: TextAlign.right,
                                style: AppTextStyle.darkGrey13Bold.copyWith(
                                    color: AppColors.secondaryColor))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context); // Go back to previous screen
                      },
                      child: const Text('Edit'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GetBuilder<ParcelController>(
                        builder: (_parcelController) {
                      return Visibility(
                        visible: !_parcelController.inProgress,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            log("yur uebuhuew " + widget.parcelId.toString());
                            if (widget.parcelId == null) {
                              bool response = await Get.find<ParcelController>().addParcel(
                                  ParcelData(
                                      customerId:
                                          _parcelDataController.receiverId,
                                      pickupLocation: _parcelDataController
                                              .pickupZoneValue ??
                                          "",
                                      receiverName:
                                          _parcelDataController.nameValue ?? "",
                                      phoneNumber: _parcelDataController
                                              .phoneNumberValue ??
                                          "",
                                      receiverAddress: _parcelDataController
                                              .receiverAddressValue ??
                                          '',
                                      deliveryZone: _parcelDataController
                                              .deliveryZoneValue ??
                                          '',
                                      invoiceId:
                                          _parcelDataController.invoiceIdValue ??
                                              '',
                                      productCategory: _parcelDataController
                                              .productCategoryValue ??
                                          '',
                                      cod: _parcelDataController.cashAmountValue ?? '',
                                      sellingPrice: _parcelDataController.sellingPriceValue ?? "",
                                      weight: _parcelDataController.weightValue ?? '',
                                      deliveryCharge: _deliveryChargeInfoController.totalCharge),
                                  widget.products);
                              if (response) {
                                Get.snackbar("Great", "Parcel Created");
                                Get.to(const ParcelsTrackScreen());
                              }
                            } else {
                              bool response = await Get.find<ParcelController>().updateParcel(
                                  ParcelData(
                                      customerId:
                                          _parcelDataController.receiverId,
                                      pickupLocation: _parcelDataController
                                              .pickupZoneValue ??
                                          "",
                                      receiverName:
                                          _parcelDataController.nameValue ?? "",
                                      phoneNumber: _parcelDataController
                                              .phoneNumberValue ??
                                          "",
                                      receiverAddress: _parcelDataController
                                              .receiverAddressValue ??
                                          '',
                                      deliveryZone: _parcelDataController
                                              .deliveryZoneValue ??
                                          '',
                                      invoiceId:
                                          _parcelDataController.invoiceIdValue ??
                                              '',
                                      productCategory: _parcelDataController
                                              .productCategoryValue ??
                                          '',
                                      cod: _parcelDataController.cashAmountValue ?? '',
                                      sellingPrice: _parcelDataController.sellingPriceValue ?? "",
                                      weight: _parcelDataController.weightValue ?? '',
                                      deliveryCharge: _deliveryChargeInfoController.totalCharge),
                                  widget.products,
                                  widget.parcelId ?? 0);
                              if (response) {
                                Get.snackbar("Great", "Parcel Updated");
                                Get.to(const ParcelsTrackScreen());
                              }
                            }
                          },
                          child: const Text('Confirm'),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:e_courier_360/data/models/local/parcel_body.dart';
// import 'package:e_courier_360/data/models/response/parcel_details_response.dart';
// import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/local/parcel_data_controller.dart';
// import 'package:e_courier_360/presentation/ui/screens/common_module/parcels_screen/parcels_screen.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
// import 'package:e_courier_360/presentation/ui/widgets/parcel/parcel_view_txt.dart';
// import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel_screen/common/product_listview.dart';
// import 'package:e_courier_360/presentation/utility/app_colors.dart';
// import 'package:e_courier_360/presentation/utility/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class ParcelPreviewScreen extends StatefulWidget {
//   final List <Item> products;
//   const ParcelPreviewScreen({super.key,
//     required this.products,});

//   @override
//   State<ParcelPreviewScreen> createState() => _ParcelPreviewScreenState();
// }

// class _ParcelPreviewScreenState extends State<ParcelPreviewScreen> {
//  final ParcelDataController _parcelDataController= Get.find<ParcelDataController>();
//  final ParcelController parcelController= Get.find();
//  @override
//   void initState() {
//   parcelController.caculateDeliveryCharge(_parcelDataController.deliveryTypeValue??'',widget.products, _parcelDataController.merchantId!,_parcelDataController.cashAmountValue??"0");
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "Confim Percel",
//           style: TextStyle(color: Colors.white),
//         ),
//         leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//              children: [
//               const HeaderText(title: "Parcel Information:"),
//               const Divider(),
//               ParcelViewText(
//                prefix:'Merchant: ',
//                text:  _parcelDataController.merchantNameValue??'',
//               ),
//               const SizedBox(height: 10),
//               ParcelViewText(
//                prefix:'Pickup Location: ',
//                text:  _parcelDataController.pickupZoneValue??'',
//               ),
//               const SizedBox(height: 10),
//               ParcelViewText(
//                prefix: 'Name: ',
//                text:   _parcelDataController.nameValue??'',
//               ),
//               const SizedBox(height: 10),
//               ParcelViewText(
//                 prefix:'Phone Number: ',
//                 text:  _parcelDataController.phoneNumberValue??'',
//               ),
//               const SizedBox(height: 10),
//               ParcelViewText(
//                 prefix:'Receiver Address: ',
//                 text: _parcelDataController.receiverAddressValue??'',
//               ),
//               const SizedBox(height: 10),
//               ParcelViewText(
//                prefix:'Delivery Area: ',
//                text:  _parcelDataController.deliveryZoneValue??'',
//               ),
//               const SizedBox(height: 10),
//               ParcelViewText(
//                prefix: 'Merchant Invoice ID: ',
//                text:   _parcelDataController.invoiceIdValue??'',
//               ),
//               const SizedBox(height: 10),
//               ParcelViewText(
//                 prefix:'Cash Money Amount: ',
//                 text:  _parcelDataController.cashAmountValue??'',
//               ),
//               const SizedBox(height: 10),
//               ParcelViewText(
//               prefix:  'Selling Price Amount: ',
//               text:  _parcelDataController.sellingPriceValue??'',
//               style: AppTextStyle.darkGrey13Bold.copyWith(color: AppColors.secondaryColor)
//               ),
//               ProductListView(product: widget.products,),
//               const HeaderText(title: "Charges:"),
//               ParcelViewText(
//               prefix:'Delivery Charges: ',
//               text:parcelController.deliverCharge.toString(),
//             ),
//             const SizedBox(height: 10),
//             ParcelViewText(
//             prefix:  'Service & COD Charges:',
//             text: parcelController.charge.toStringAsFixed(2)
//             //  _deliveryChargeInfoController.getTotalCharge(widget.products,deliveryTypeIndex,_parcelDataController.cashAmountValue??'') ,
//             ),
//              const Divider(),
//                Row(children: [
//                Expanded(child: Text("Total:", style: AppTextStyle.primary14w600)),
//                Expanded(child: Text( parcelController.chargeWithCOD.toStringAsFixed(2),
//                textAlign: TextAlign.right, style:AppTextStyle.darkGrey13Bold.copyWith(color: AppColors.secondaryColor))),
//                  ],),
//                    ],
//                   ),
//                  ),
//                 ),
            
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       const SizedBox(width: 10),
//                       Expanded(
//                         child: OutlinedButton(
//                           onPressed: () {
//                             Navigator.pop(context); // Go back to previous screen
//                           },
//                           child: const Text('Edit'),
//                         ),
//                       ),
//                       const SizedBox(width: 10,),
//                       Expanded(
//                         child: GetBuilder<ParcelController>(
//                           builder: (parcelController) {
//                             return Visibility(
//                               visible:!parcelController.inProgress,
//                               replacement: const Center(child: CircularProgressIndicator(),),
//                               child: ElevatedButton(
//                                 onPressed: () async{
//                                 AddparcelData addp=collectAddparcelData();
//                                   if(_parcelDataController.parcelId==null){
//                                      bool response=await Get.find<ParcelController>().addParcel(addp);
//                                  if(response){
//                                   Get.back();
//                                   Get.snackbar("Great" ,"Parcel Created");
//                                   Get.off(const ParcelsTrackScreen());
//                                  }
//                                   }
//                                   else{
//                                     bool response=await Get.find<ParcelController>().updateParcel(addp,_parcelDataController.parcelId!);
//                                  if(response){
//                                   Get.back();
//                                   Get.back();
//                                   Get.snackbar("Great" ,"Parcel Updated");
//                                   Get.off(const ParcelsTrackScreen());
//                                  }
//                                   }
                                
//                                 },
//                                 child: const Text('Confirm'),
//                               ),
//                             );
//                           }
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//           ],
//         ),
//       ),
//     );
//   }
//   AddparcelData collectAddparcelData(){
//     List<String> productType=widget.products.map((product) => product.productType.toString()).toList();
//     List<String> weight=widget.products.map((product) => product.weight.toString()).toList();
//     List<String> itemDescription=widget.products.map((product) => product.itemDescription).toList();
//     List<String> quantity=widget.products.map((product) => product.quantity.toString()).toList();
//     List<String> heightLeft=widget.products.map((product) => product.heightLeft).toList();
//     List<String> heightRight=widget.products.map((product) => product.heightRight).toList();
//   return  AddparcelData(receiverPhone: _parcelDataController.phoneNumberValue!, 
//   receiverAddress:  _parcelDataController.receiverAddressValue!, 
//   receiverName:  _parcelDataController.nameValue!, merchantId: _parcelDataController.merchantId.toString(),
//    merchantInvoiceId:  _parcelDataController.invoiceIdValue!, shippingModeType:  _parcelDataController.deliveryTypeID??0, 
//    deliveryDate: DateTime.now().toIso8601String(), timeSlot:parcelController.timeSlot,
//     pickupZoneId: _parcelDataController.pickupZoneId??0, deliveryZoneId: _parcelDataController.deliveryZoneId??0, 
//     cashCollection: _parcelDataController.cashAmountValue!, parcelEquivalentPrice:  _parcelDataController.sellingPriceValue!,
//      deliveryCharge:parcelController.chargeWithCOD.toString(), productType: productType, weight: weight, 
//      itemDescription: itemDescription, quantity: quantity, heightLeft: heightLeft, heightRight: heightRight,
//       deliveryStatus: '1', receiverId:_parcelDataController.receiverId);
  
//   }
//   }