
import 'package:e_courier_360/data/models/parcel.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/state_holders/category_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/parcel_data_controller.dart';
import 'package:e_courier_360/presentation/state_holders/pickup_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/product_controller.dart';
import 'package:e_courier_360/presentation/state_holders/receiver_controller.dart';
import 'package:e_courier_360/presentation/state_holders/rider_controller.dart';
import 'package:e_courier_360/presentation/state_holders/stepper_controller.dart';
import 'package:e_courier_360/presentation/state_holders/update_status_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/payment_screen/make_payment_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/parcels/update_status_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel/send_parcel_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
import 'package:e_courier_360/presentation/ui/widgets/parcel/parcel_view_txt.dart';
import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:e_courier_360/presentation/utility/text_style.dart';
import 'package:e_courier_360/presentation/utility/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../send_parcel/common/product_listview.dart';


class PercelViewScreen extends StatefulWidget {
  final Parcel parcelData;
  const PercelViewScreen({Key? key, required this.parcelData}) : super(key: key);

  @override
  State<PercelViewScreen> createState() => _PercelViewScreenState();
}

class _PercelViewScreenState extends State<PercelViewScreen> {
 final DeliveryZoneController _deliveryZoneController= Get.find<DeliveryZoneController>();
 final PickUpZoneController _pickupZoneController= Get.find<PickUpZoneController>();
 final ReceiverController _receiverController= Get.find<ReceiverController>();
 final ProductController _productController= Get.find<ProductController>();
 
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ProductController>().getProducts(widget.parcelData.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Parcel",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<CategoryController>(
          builder: (context) {
            return Container(
              child: GetBuilder<CategoryController>(
                builder: (categoryController) {
                  return Visibility(
                    visible: !categoryController.inProgress ,
                    replacement: const Center(child: CircularProgressIndicator()),
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
                           Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [GestureDetector(onTap: ()async{
                                await Clipboard.setData(ClipboardData(text:widget.parcelData.voucherId ));
                                showToast("Voucher ID Copied");
                            }, child: const Icon(Icons.copy))],),
                          ParcelViewText(
                           prefix:'Pickup Location: ',
                           text:  _pickupZoneController.getPickupZoneById(widget.parcelData.pickupZone).name,
                          ),
                          const SizedBox(height: 10),
                          ParcelViewText(
                           prefix: 'Name: ',
                           text: _receiverController.getReceiverFromId(widget.parcelData.receiver).name,
                          ),
                          const SizedBox(height: 10),
                          ParcelViewText(
                            prefix:'Phone Number: ',
                            text: _receiverController.getReceiverFromId(widget.parcelData.receiver).phone,
                          ),
                          const SizedBox(height: 10),
                          ParcelViewText(
                            prefix:'Receiver Address: ',
                            text:  widget.parcelData.deliveryAddress,
                          ),
                          const SizedBox(height: 10),
                          ParcelViewText(
                           prefix:'Delivery Area: ',
                           text: _deliveryZoneController.getDeliveryZoneFromId( widget.parcelData.deliveryZone,).name
                          ),
                          const SizedBox(height: 10),
                          ParcelViewText(
                           prefix: 'Merchant Invoice ID: ',
                           text: widget.parcelData.merchantInvoiceId??"",
                          ),
                          const SizedBox(height: 10),
                          ParcelViewText(
                            prefix:'Cash Money Amount: ',
                            text:  widget.parcelData.cod,
                          ),
                          const SizedBox(height: 10),
                          ParcelViewText(
                          prefix:  'Selling Price Amount: ',
                          text:   widget.parcelData.parcelEquivalentPrice,
                          style: AppTextStyle.darkGrey13Bold.copyWith(color: AppColors.secondaryColor)
                          ),
                          GetBuilder<ProductController>(
                            builder: (controller) {
                              return ProductListView(product:_productController.products );
                            }
                          ),
                         
                         const Divider(),
                          const SizedBox(width: 5,),
                           Row(children: [
                           Expanded(child: Text("Total Charge:", style: AppTextStyle.primary14w600)),
                           Expanded(child: Text( widget.parcelData.deliveryCharge,
                           textAlign: TextAlign.right, style:AppTextStyle.darkGrey13Bold.copyWith(color: AppColors.secondaryColor))),
                             ],),
                               ],
                              ),
                             ),
                            ),
                        
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                              if(widget.parcelData.deliveryStatus==1 && AuthController.userRole!='Rider')
                             Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  Get.lazyPut<StepperController>(() => StepperController());
                                  Get.lazyPut<ParcelDataController>(() => ParcelDataController());
                                  Get.to( SendPercelScreen(parcel:widget.parcelData,products: Get.find<ProductController>().products,));
                                },
                                child: const Text('Edit'),
                              ),
                            ),
                                   const SizedBox(width: 10,),
                                 if((AuthController.userRole==1||AuthController.userRole==2||AuthController.userRole==4) && widget.parcelData.deliveryStatus!=13)
                              Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                Get.find<ParcelStatusController>().toggleSelection(widget.parcelData);
                                if(widget.parcelData.deliveryStatus==8||widget.parcelData.deliveryStatus==9){
                                Get.to(const MakePaymentScreen());
                                }else{
                                 Get.lazyPut<RiderController>(() => RiderController());
                                 Get.to(const UpdateStatusScreen());
                                }
                                },
                                child: (widget.parcelData.deliveryStatus==8||widget.parcelData.deliveryStatus==9)?
                                const Text('Make Payment'):const Text('Update Status'),
                              ))
                                ],
                              ),
                            ),
                      ],
                    ),
                  );
                }
              ),
            );
          }
        ),
      ),
    );
  }}

// laravel version

// import 'package:e_courier_360/data/models/body/booking.dart';
// import 'package:e_courier_360/presentation/state_holders/local/parcel_data_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/local/stepper_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/stepper_controller.dart';
// import 'package:e_courier_360/presentation/ui/screens/admin_panel/payment_screen/make_payment_screen.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
// import 'package:flutter/services.dart';
// import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/dashboard_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/update_status_controller.dart';
// import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel_screen/send_parcel_screen.dart';
// import 'package:e_courier_360/presentation/ui/screens/common_module/parcels_screen/update_status_screen.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
// import 'package:e_courier_360/presentation/ui/widgets/parcel/parcel_view_txt.dart';
// import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel_screen/common/product_listview.dart';
// import 'package:e_courier_360/presentation/utility/app_colors.dart';
// import 'package:e_courier_360/presentation/utility/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:e_courier_360/presentation/utility/toast.dart';


// class PercelViewScreen extends StatefulWidget {
//   final Booking parcelData;
//   const PercelViewScreen({super.key, required this.parcelData});

//   @override
//   State<PercelViewScreen> createState() => _PercelViewScreenState();
// }

// class _PercelViewScreenState extends State<PercelViewScreen> {

// final DashBoardController dashBoardController =Get.find();
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Get.find<ParcelController>().getParcelDetails(widget.parcelData.id);
//     });
//   }
//  final ParcelStatusController parcelStatusController=Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "Parcel",
//           style: TextStyle(color: Colors.white),
//         ),
//         leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
//       ),
//       body: SingleChildScrollView(
//         child: GetBuilder<ParcelController>(
//           builder: (parcelController) {
//             if(parcelController.bookingViewResponse==null){
//               return Container();
//             }
//           final Booking parcel= parcelController.bookingViewResponse!.data.booking;
//             return Visibility(
//               visible: !parcelController.inProgress ,
//               replacement: const CenterCircularProgressIndicator(),
//               child: Column(
//                 children: [
//                   Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
                    
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                    children: [
//                     const HeaderText(title: "Percel Information:"),
//                     const Divider(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [GestureDetector(onTap: ()async{
//                           await Clipboard.setData(ClipboardData(text:parcel.voucherId ));
//                           showToast("Voucher ID Copied");
//                       }, child: const Icon(Icons.copy))],),
//                      ParcelViewText(
//                         prefix:'Voucher Id: ',
//                         text: parcel.voucherId,
//                        ),
//                      ParcelViewText(
//                       prefix:'Merchant: ',
//                       text:  "${parcel.merchent.username}-(${parcel.merchent.pickupPhone})",
//                      ),
//                      const SizedBox(height: 10),
//                     ParcelViewText(
//                      prefix:'Pickup Location: ',
//                      text:"${parcel.pzone?.name}"
//                     ),
//                     const SizedBox(height: 10),
//                     ParcelViewText(
//                      prefix: 'Receiver Name: ',
//                      text:"${parcel.receiver.name} ",
//                     ),
//                     const SizedBox(height: 10),
//                     ParcelViewText(
//                       prefix:'Phone Number: ',
//                       text: "${parcel.receiver.phone} ",
//                     ),
//                     const SizedBox(height: 10),
//                     ParcelViewText(
//                       prefix:'Receiver Address: ',
//                       text: "${parcel.receiver.address} ",
//                     ),
//                     const SizedBox(height: 10),
//                     ParcelViewText(
//                      prefix:'Delivery Area: ',
//                      text: "${parcel.dzone?.name} "
//                     ),
//                     const SizedBox(height: 10),
//                     ParcelViewText(
//                      prefix: 'Merchant Invoice ID: ',
//                      text: "${parcel.marchentInvoiceId} ",
//                     ),
//                     const SizedBox(height: 10),
//                     ParcelViewText(
//                       prefix:'Cash Money Amount: ',
//                       text:  "${parcel.cashCollection} ",
//                     ),
//                     const SizedBox(height: 10),
//                     ParcelViewText(
//                     prefix:  'Selling Price Amount: ',
//                     text: "${parcel.parcelEquivalentPrice} ",
//                     style: AppTextStyle.darkGrey13Bold.copyWith(color: AppColors.secondaryColor)
//                     ),
//                     GetBuilder<ParcelController>(
//                       builder: (controller) {
//                         return ProductListView(product:controller.bookingViewResponse?.data.booking.items );
//                       }
//                     ),
                   
//                     const Divider(height: 8,),
//                      Row(children: [
//                      Expanded(child: Text("Total Charge:", style: AppTextStyle.primary14w600)),
//                      Expanded(child: Text( "${parcel.deliveryCharge} ",
//                      textAlign: TextAlign.right, style:AppTextStyle.darkGrey13Bold.copyWith(color: AppColors.secondaryColor))),
//                        ],),
//                          ],
//                         ),
//                        ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             const SizedBox(width: 10),
//                             if(parcel.status?.id==1)
//                             Expanded(
//                               child: OutlinedButton(
//                                 onPressed: () {
//                                   Get.lazyPut<StepperController>(() => StepperController());
//                                   Get.lazyPut<ParcelDataController>(() => ParcelDataController());
//                                   Get.to( SendPercelScreen(bookingViewResponse:Get.find<ParcelController>().bookingViewResponse));
//                                 },
//                                 child: const Text('Edit'),
//                               ),
//                             ),
//                             const SizedBox(width: 10,),
//                             if((AuthController.userRole=='Superadmin'||AuthController.userRole=='Rider') && parcel.status!.id!=13)
//                             Expanded(
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                 parcelStatusController.toggleSelection(parcel);
//                                 if(parcel.status?.id==8||parcel.status?.id==9){
//                                 Get.to(const MakePaymentScreen());
//                                 }else{
//                                  Get.to(const UpdateStatusScreen());
//                                 }
//                                 },
//                                 child: (parcel.status?.id==8||parcel.status?.id==9)?
//                                 const Text('Make Payment'):const Text('Update Status'),
//                               ))
//                           ],
//                         ),
//                       ),
//                 ],
//               ),
//             );
//           }
//         ),
//       ),
//     );
//   }}
