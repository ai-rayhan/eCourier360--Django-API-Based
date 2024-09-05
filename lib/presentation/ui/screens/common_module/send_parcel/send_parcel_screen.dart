import 'package:e_courier_360/data/models/parcel.dart';
import 'package:e_courier_360/data/models/product.dart';
import 'package:e_courier_360/presentation/state_holders/category_controller.dart';
import 'package:e_courier_360/presentation/state_holders/parcel_data_controller.dart';
import 'package:e_courier_360/presentation/state_holders/receiver_controller.dart';
import 'package:e_courier_360/presentation/state_holders/stepper_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel/delivery_information_form.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel/parcel_information_form.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel/parcel_preview_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel/product_information_form.dart';

import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendPercelScreen extends StatefulWidget {
  const SendPercelScreen({super.key, this.parcel, this.products});
  final Parcel? parcel;
  final List<Product>? products;
  @override
  State<SendPercelScreen> createState() => _SendPercelScreenState();
}

class _SendPercelScreenState extends State<SendPercelScreen> {
  final _formKey = GlobalKey<FormState>();
  List<Step> get _steps => [destinationStep(),parcelInformation(),productDetails(),];

  final StepperController _stepperController= Get.find<StepperController>();
  final ParcelDataController _parcelDataController= Get.find<ParcelDataController>();

  @override
  void initState() {
    super.initState();
      if(widget.products!=null){
      _stepperController.productCategory.clear();
      _stepperController.setProductList=widget.products!;
      for (Product product in widget.products!){
        _stepperController.productCategory.add(Get.find<CategoryController>().getNameFromId(product.productType));
      }
      _parcelDataController.setParcel=widget.parcel!;
    }
    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await Get.find<PickUpZoneController>().getPickupZone();
    //   await Get.find<DeliveryZoneController>().getDeliveryZone();
    //   await Get.find<ReceiverController>().getReceivers();
    //   await Get.find<CategoryController>().getCategories();
    //   await Get.find<DeliveryTypeInfoController>().getDeliveryTypeInfo();
    //   if(AuthController.userRole==0||AuthController.userRole==1){
    //     await Get.find<MerchantController>().getAllMerchants();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Parcel',style: TextStyle(color: AppColors.whiteColor),
        ),
       leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
      ),
      body:Form(
             key: _formKey,
             child: GetBuilder<StepperController>(
               builder: (stepperController) {
                 return Stepper(
                   type: StepperType.horizontal,
                   currentStep: stepperController.currentStep,
                   steps: _steps,
                   controlsBuilder: (BuildContext context, ControlsDetails details) {
                     return Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Expanded(
                           child: ElevatedButton(
                             onPressed: details.onStepCancel,
                             child: const Text('Back'),
                           ),
                         ),
                         const SizedBox(
                           width: 16,
                         ),
                         GetBuilder<ReceiverController>(
                           builder: (receiverController) {
                             return Expanded(
                               child: Visibility(
                                 visible:!receiverController.inProgress ,
                                 replacement: const Center(child: CircularProgressIndicator(),),
                                 child: ElevatedButton(
                                   onPressed: details.onStepContinue,
                                   child: const Text('Continue'),
                                 ),
                               ),
                             );
                           }
                         ),
                       ],
                     );
                   },
                   onStepContinue: () async{
                      final bool isLast= stepperController.updateCurrentStep(_steps);
                      if(isLast && _formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                          if(_parcelDataController.receiverId==null){
                          bool response= await Get.find<ReceiverController>().addReceiver(_parcelDataController.nameValue??'',_parcelDataController.phoneNumberValue??'',_parcelDataController.receiverAddressValue??'','');
                          if(response==false){
                           return;
                          }
                         }
                        Get.to(ParcelPreviewScreen( parcelId:Get.find<ParcelDataController>().parcel?.id , products: Get.find<StepperController>().productList, ));
                      }
                   },
                   onStepCancel: () {
                     setState(() {
                       stepperController.backCurrentStep(_steps);
                     });
                   },
                 );
               }
             ),
           )
       
    );
  }

Step destinationStep() {
    return Step(
      isActive: _stepperController.currentStep >= 0,
      title: const Text('Deliver To'),
      content:  DestinationInfoForm(parcel: widget.parcel,),
    );
  }

  Step parcelInformation() {
    return Step(
      isActive: _stepperController.currentStep >= 1,
      title: const Text('Parcel'),
      content:  ParcelInformationForm(parcel: widget.parcel,)
    );
  }

  
Step productDetails() {
    return Step(
      isActive: _stepperController.currentStep >= 2,
      title: const Text('Products'),
      content: const ProductInfoForm()
    );
  }
}



// import 'package:e_courier_360/data/models/response/parcel_details_response.dart';
// import 'package:e_courier_360/presentation/state_holders/local/stepper_controller.dart';
// import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel_screen/delivery_information_form.dart';
// import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel_screen/parcel_information_form.dart';
// import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel_screen/parcel_preview_screen.dart';
// import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel_screen/product_information_form.dart';
// import 'package:e_courier_360/presentation/utility/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SendPercelScreen extends StatefulWidget {
//   const SendPercelScreen({super.key, this.bookingViewResponse});
//   final BookingViewResponse? bookingViewResponse;
//   @override
//   State<SendPercelScreen> createState() => _SendPercelScreenState();
// }

// class _SendPercelScreenState extends State<SendPercelScreen> {
//   final _formKey = GlobalKey<FormState>();
//   List<Step> get _steps => [destinationStep(),parcelInformation(),productDetails(),];

//   final StepperController _stepperController= Get.find<StepperController>();

//   @override
//   void initState() {
//     super.initState();
// //  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       if(widget.bookingViewResponse!=null){
//       _stepperController.productCategory.clear();
//       _stepperController.setProductList=widget.bookingViewResponse!.data.booking.items!;
//       for (Item item in widget.bookingViewResponse!.data.booking.items!){
//         _stepperController.productCategory.add(item.type!.title);
//       }
//     }
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Add Parcel',style: TextStyle(color: AppColors.whiteColor),
//         ),
//        leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
//         ),
//       ),
//       body:Form(
//              key: _formKey,
//              child: GetBuilder<StepperController>(
//                builder: (stepperController) {
//                  return Stepper(
//                    type: StepperType.horizontal,
//                    currentStep: stepperController.currentStep,
//                    steps: _steps,
//                    controlsBuilder: (BuildContext context, ControlsDetails details) {
//                      return Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Expanded(
//                            child: ElevatedButton(
//                              onPressed: details.onStepCancel,
//                              child: const Text('Back'),
//                            ),
//                          ),
//                          const SizedBox(
//                            width: 16,
//                          ),
                       
//                               Expanded(
//                                child: ElevatedButton(
//                                  onPressed: details.onStepContinue,
//                                  child: const Text('Continue'),
//                                ),
//                              ),
                           
                         
//                        ],
//                      );
//                    },
//                    onStepContinue: () async{
//                       final bool isLast= stepperController.updateCurrentStep(_steps);
//                       if(isLast && _formKey.currentState!.validate()){
//                         _formKey.currentState!.save();
//                         Get.to(ParcelPreviewScreen( products: Get.find<StepperController>().productList, ));
//                       }else if(isLast && !_formKey.currentState!.validate()){
//                         Get.snackbar("Warning", "Fill data corectly",backgroundColor: AppColors.whiteColor.withOpacity(.5));
//                       }
//                    },
//                    onStepCancel: () {
//                      setState(() {
//                        stepperController.backCurrentStep(_steps);
//                      });
//                    },
//                  );
//                }
//              ),
//            )
       
//     );
//   }

// Step destinationStep() {
//     return Step(
//       isActive: _stepperController.currentStep >= 0,
//       title: const Text('Deliver To'),
//       content:  DestinationInfoForm(bookingViewResponse: widget.bookingViewResponse,),
//     );
//   }

//   Step parcelInformation() {
//     return Step(
//       isActive: _stepperController.currentStep >= 1,
//       title: const Text('Parcel'),
//       content:  ParcelInformationForm(bookingViewResponse: widget.bookingViewResponse,)
//     );
//   }

  
// Step productDetails() {
//     return Step(
//       isActive: _stepperController.currentStep >= 2,
//       title: const Text('Products'),
//       content: const ProductInfoForm()
//     );
//   }
// }
