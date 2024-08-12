import 'package:e_courier_360/data/models/parcel.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/state_holders/merchant_controller.dart';
import 'package:e_courier_360/presentation/state_holders/parcel_data_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/input_card.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParcelInformationForm extends StatefulWidget {
  const ParcelInformationForm({super.key, required this.parcel});
  final Parcel? parcel;
  @override
  State<ParcelInformationForm> createState() => _ParcelInformationFormState();
}

class _ParcelInformationFormState extends State<ParcelInformationForm> {
  final TextEditingController _merchantInvoiceTEController=TextEditingController();
  final TextEditingController _cashAmountTEController=TextEditingController();
  final TextEditingController _sellingPriceTEController=TextEditingController();
  @override
  void initState() {
    if(widget.parcel!=null){
    initilizeData();
    }
    super.initState();
  }
  
  initilizeData(){
    _merchantInvoiceTEController.text=widget.parcel!.merchantInvoiceId??'';
    _cashAmountTEController.text=widget.parcel!.cod;
    _sellingPriceTEController.text=widget.parcel!.parcelEquivalentPrice;
  }
  @override
  Widget build(BuildContext context) {
    ParcelDataController parcelDataController= Get.find<ParcelDataController>();
    return Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const HeaderText(title: "Percel Information"),
        GetBuilder<MerchantController>(
          builder: (merchantController) {
         List<String>  pickupZones= merchantController.merchantList.map((zone) => zone.shopName).toList();
            return InputCard(
              child: Visibility(
                visible: !merchantController.inProgress,
                replacement: const Center(child: SizedBox( child:Text('Loading..')),),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Pickup Zone',
                    prefixIcon: Icon(Icons.local_taxi_rounded),
                  ),
                  value:null,
                  // value:pickUpZoneController.getPickupZoneById(widget.parcel?.pickupZone??0)?.name,
                  items: pickupZones.map((level) {
                    return DropdownMenuItem<String>(
                      value: level,
                      child: Text(
                        level,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    Get.find<AuthController>().updateMerchantId(1);
                    // parcelDataController.pickupZoneValue=value;
                    // parcelDataController.parcel.pickupZone=pickUpZoneController.getIdFromPickupZone(value??'');
                    // setState(() {
                    //   _pickupZone = value;
                    // });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your pickup Zone';
                    }
                    return null;
                  },
                ),
              ),
            );
          }
        ),
          InputCard(
            child: TextFormField(
              controller: _merchantInvoiceTEController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: 'Marchent Invoice ID',
                  prefixIcon: Icon(Icons.insert_page_break_rounded)),
              onSaved: (newValue) => parcelDataController.invoiceIdValue=newValue,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Enter Marchent Invoice ID';
                }
                return null;
              },
            ),
          ),
        
          const SizedBox(
            height: 10,
          ),
          InputCard(
            child: TextFormField(
              controller: _cashAmountTEController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: 'Cash Money Amount',
                  hintText: 'Cash Money Amount',
                  prefixIcon: Icon(Icons.hourglass_top_outlined)),
              onSaved: (newValue) => parcelDataController.cashAmountValue=newValue,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Enter Cash Money Amount';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InputCard(
            child: TextFormField(
              controller: _sellingPriceTEController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: 'Selling Price Amount',
                  hintText: 'Selling Price Amount',
                  prefixIcon: Icon(Icons.hourglass_top_outlined)),
              onSaved: (newValue) =>parcelDataController.sellingPriceValue=newValue,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Enter Selling Price Amount';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      );
  }
}

// import 'package:e_courier_360/data/models/response/parcel_details_response.dart';
// import 'package:e_courier_360/presentation/state_holders/local/parcel_data_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
// import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel_screen/delivery_information_form.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ParcelInformationForm extends StatefulWidget {
//   const ParcelInformationForm({super.key, required this.bookingViewResponse});
//   final BookingViewResponse? bookingViewResponse;
//   @override
//   State<ParcelInformationForm> createState() => _ParcelInformationFormState();
// }

// class _ParcelInformationFormState extends State<ParcelInformationForm> {
//   final TextEditingController _merchantInvoiceTEController = TextEditingController();
//   final TextEditingController _cashAmountTEController = TextEditingController();
//   final TextEditingController _sellingPriceTEController = TextEditingController();

//   @override
//   void initState() {
//     if (widget.bookingViewResponse != null) {
//       initilizeData();
//     }
//     super.initState();
//   }

//   initilizeData() {
//     ParcelController parcelController = Get.find();
//     _merchantInvoiceTEController.text = parcelController.bookingViewResponse!.data.booking.marchentInvoiceId;
//     _cashAmountTEController.text = parcelController.bookingViewResponse!.data.booking.cashCollection.toString();
//     _sellingPriceTEController.text = parcelController.bookingViewResponse!.data.booking.parcelEquivalentPrice;
//   }

//   @override
//   Widget build(BuildContext context) {
//     ParcelDataController parcelDataController = Get.find<ParcelDataController>();
//     ParcelController parcelController = Get.find<ParcelController>();
//     return Column(
//       children: [
//         const SizedBox(height: 10),
//         const HeaderText(title: "Merchant information:"),
//         CustomDropdownField(
//           hintText: 'Merchant',
//           value: parcelDataController.merchantNameValue,
//           icon: const Icon(Icons.apartment),
//           items: parcelController.combinedMerchants.map((level) {
//             return DropdownMenuItem<String>(
//               value: level,
//               child: Text(
//                 level,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             );
//           }).toList(),
//           onChanged: (value) {
//             parcelDataController.merchantNameValue = value;
//             int selectedIndex = parcelController.combinedMerchants.indexOf(value!);
//             parcelDataController.merchantId = parcelController.merchantIds[selectedIndex];
//           },
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please select Merchant';
//             }
//             return null;
//           },
//         ),
//         const SizedBox(height: 10),
//         const HeaderText(title: "Parcel Information"),
//         CustomInputField(
//           controller: _merchantInvoiceTEController,
//           hintText: 'Merchant Invoice ID',
//           icon: const Icon(Icons.insert_page_break_rounded),
//           onSavedForm: (newValue) => parcelDataController.invoiceIdValue = newValue,

//         ),
//         const SizedBox(height: 10),
//         CustomInputField(
//           controller: _cashAmountTEController,
//           hintText: 'Cash Money Amount',
//           icon: const Icon(Icons.hourglass_top_outlined),
//           onSavedForm: (newValue) => parcelDataController.cashAmountValue = newValue,

//         ),
//         const SizedBox(height: 10),
//         CustomInputField(
//           controller: _sellingPriceTEController,
//           hintText: 'Selling Price Amount',
//           icon: const Icon(Icons.hourglass_top_outlined),
//           onSavedForm: (newValue) => parcelDataController.sellingPriceValue = newValue,

//         ),
//         const SizedBox(height: 16),
//       ],
//     );
//   }
// }
