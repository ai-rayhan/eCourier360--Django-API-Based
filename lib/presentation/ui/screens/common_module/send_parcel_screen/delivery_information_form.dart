  
import 'package:e_courier_360/data/models/parcel.dart';
import 'package:e_courier_360/data/models/receiver.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_type_controller.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/parcel_data_controller.dart';
import 'package:e_courier_360/presentation/state_holders/pickup_zone_controller.dart';
import 'package:e_courier_360/presentation/state_holders/receiver_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/input_card.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class DestinationInfoForm extends StatefulWidget {
  const DestinationInfoForm({
    super.key, required this.parcel,
  });
  final Parcel? parcel;
  @override
  State<DestinationInfoForm> createState() => _DestinationInfoFormState();
}

class _DestinationInfoFormState extends State<DestinationInfoForm> {
  
final TextEditingController _nameTEController=TextEditingController();
final TextEditingController _phoneTEController=TextEditingController();
final TextEditingController _addressTEController=TextEditingController();

@override
  void initState() {
    if(widget.parcel!=null){
      initializedData();
    }
    super.initState();
  }

   
  initializedData(){
   ParcelDataController parcelDataController= Get.find();
   PickUpZoneController pickupController= Get.find();
   DeliveryZoneController deliveryZoneController= Get.find();
   DeliveryTypeInfoController deliveryTypeInfoController= Get.find();
   final Receiver receiver=Get.find<ReceiverController>().getReceiverFromId(widget.parcel!.receiver);
        parcelDataController.pickupZoneValue=pickupController.getPickupZoneById(widget.parcel!.pickupZone).name;
       _phoneTEController.text=receiver.phone;
       _addressTEController.text=receiver.address;
       _nameTEController.text=receiver.name;
       parcelDataController.receiverId= receiver.id; 
       parcelDataController.deliveryZoneValue=deliveryZoneController.getDeliveryZoneFromId(widget.parcel!.deliveryZone).name;
       parcelDataController.deliveryTypeValue=deliveryTypeInfoController.getDeliveryTypeFromId(widget.parcel!.deliveryType).deliveryType;
  }
  
  @override
  Widget build(BuildContext context) {
   final ParcelDataController parcelDataController= Get.find<ParcelDataController>();
    return Column(
      children: [
        const HeaderText(title: "Pickup Zone information:"),
        GetBuilder<PickUpZoneController>(
          builder: (pickUpZoneController) {
         List<String>  pickupZones= pickUpZoneController.pickupZones.map((zone) => zone.name).toList();
            return InputCard(
              child: Visibility(
                visible: !pickUpZoneController.inProgress,
                replacement: const Center(child: SizedBox( child:Text('Loading..')),),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Pickup Zone',
                    prefixIcon: Icon(Icons.local_taxi_rounded),
                  ),
                  value:parcelDataController.pickupZoneValue,
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
                    parcelDataController.pickupZoneValue=value;
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
        const SizedBox(
          height: 10,
        ),
        const HeaderText(title: "Receiver Information"),
        GetBuilder<ReceiverController>(
          builder: (receiverController) {
            List<String> filteredSuggestions= receiverController.receivers.map((zone) => zone.name).toList();
            return InputCard(
              child: EasyAutocomplete(
                controller: _nameTEController,
                suggestions: filteredSuggestions,
                decoration: const InputDecoration(
                    hintText: 'Receiver Name',
                    prefixIcon: Icon(
                      Icons.open_in_browser,
                      size: 30,
                    )),
                   
                // onSubmitted: (newValue) => setState(() {
                //   _name = newValue;
                // }),
                onChanged: (value) {
                  // setState(() {
                    parcelDataController.nameValue=value;
                  // _name = value;
                    var matchingReceivers = receiverController.receivers.where((receiver) => receiver.name == parcelDataController.nameValue).toList();
                      if (matchingReceivers.isNotEmpty) {
                        parcelDataController.phoneNumberValue = matchingReceivers.first.phone;
                        parcelDataController.receiverAddressValue = matchingReceivers.first.address;
                        parcelDataController.receiverId= matchingReceivers.first.id;
    
                        _phoneTEController.text = matchingReceivers.first.phone;
                        _addressTEController.text = matchingReceivers.first.address;
                      } else {
                        // Handle the case where no matching receiver is found
                        // For example, you could set a default value or show an error message.
                      }
                
                // });
                },
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter Receiver Name';
                  }
                  return null;
                },
              ),
            );
          }
        ),
        const SizedBox(
          height: 10,
        ),InputCard(
          child: TextFormField(
            controller: _phoneTEController,
            decoration: const InputDecoration(
                hintText: 'Receiver Phone',
                prefixIcon: Icon(
                  Icons.open_in_browser,
                  size: 30,
                )),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter Receiver Phone';
              }
              return null;
            },
            onSaved: (newValue) => parcelDataController.phoneNumberValue=newValue
          ),
        ),
        const SizedBox(
          height: 10,
        ), InputCard(
          child: TextFormField(
            controller: _addressTEController,
            decoration: const InputDecoration(
                hintText: 'Reciver Address',
                prefixIcon: Icon(
                  Icons.open_in_browser,
                  size: 30,
                )),
            onSaved: (newValue) => parcelDataController.receiverAddressValue=newValue,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter Reciver Address';
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        const HeaderText(title: "Delivery Information"),
       
        GetBuilder<DeliveryZoneController>(
          builder: (deliveryZoneController) {
            List <String> deliveryZone=deliveryZoneController.deliveryZones.map((zone) => zone.name).toList();
            return InputCard(
              child: Visibility(
                visible: !deliveryZoneController.inProgress,
                replacement: const Center(child: SizedBox( child:Text('Loading..')),),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Delivery Area',
                    prefixIcon: Icon(Icons.system_update_alt_sharp),
                  ),
                  value: parcelDataController.deliveryZoneValue,
                  items: deliveryZone.map((level) {
                    return DropdownMenuItem<String>(
                      value: level,
                      child: Text(
                        level,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    parcelDataController.deliveryZoneValue=value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your delivery Zone';
                    }
                    return null;
                  },
                ),
              ),
            );
          }
        ),
         const SizedBox(
          height: 10,
        ),
        GetBuilder<DeliveryTypeInfoController>(
          builder: (deliveryTypeInfoController) {
            List <String> deliveryZone=deliveryTypeInfoController.deliveryTypes.map((zone) => zone.deliveryType).toList();
            return InputCard(
              child: Visibility(
                visible: !deliveryTypeInfoController.inProgress,
                replacement: const Center(child: SizedBox( child:Text('Loading..')),),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Delivery Type',
                    prefixIcon: Icon(Icons.system_update_alt_sharp),
                  ),
                  value: parcelDataController.deliveryTypeValue,
                  items: deliveryZone.map((level) {
                    return DropdownMenuItem<String>(
                      value: level,
                      child: Text(
                        level,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    parcelDataController.deliveryTypeValue=value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your delivery type';
                    }
                    return null;
                  },
                ),
              ),
            );
          }
        ),
         const SizedBox(
          height: 10,
        ),
      ],
      
    );
  }
}



// import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
// import 'package:flutter/material.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/input_card.dart';
// import 'package:e_courier_360/presentation/utility/sizedbox.dart';
// import 'package:e_courier_360/presentation/utility/text_style.dart';
// import 'package:e_courier_360/data/models/response/parcel_details_response.dart';
// import 'package:e_courier_360/presentation/state_holders/local/parcel_data_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
// import 'package:easy_autocomplete/easy_autocomplete.dart';
// import 'package:get/get.dart';


// class DestinationInfoForm extends StatefulWidget {
//   const DestinationInfoForm({
//     super.key, required this.bookingViewResponse,
//   });
//   final BookingViewResponse? bookingViewResponse;
//   @override
//   State<DestinationInfoForm> createState() => _DestinationInfoFormState();
// }

// class _DestinationInfoFormState extends State<DestinationInfoForm> {
//   final TextEditingController _nameTEController = TextEditingController();
//   final TextEditingController _phoneTEController = TextEditingController();
//   final TextEditingController _addressTEController = TextEditingController();

//   late ParcelDataController parcelDataController;
//   late ParcelController parcelController;

//   @override
//   void initState() {
//     super.initState();
//     parcelDataController = Get.find<ParcelDataController>();
//     parcelController = Get.find<ParcelController>();

//     if (widget.bookingViewResponse != null) {
//       initializeData();
//     }
//   }

//   void initializeData() {
//     final parcelData = parcelController.bookingViewResponse!.data.booking;
    
//     parcelDataController
//       ..parcelID = parcelData.id
//       ..pickupZoneValue = parcelData.pzone?.name
//       ..pickupZoneId = parcelData.pzone?.id ?? 0
//       ..phoneNumberValue = parcelData.receiver.phone
//       ..receiverAddressValue = parcelData.receiver.address
//       ..receiverId = parcelData.receiver.id
//       ..nameValue = parcelData.receiver.name
//       ..deliveryZoneValue = parcelData.dzone?.name ?? ""
//       ..deliveryZoneId = parcelData.dzone?.id ?? 0
//       ..merchantNameValue = "${parcelData.merchent.username}-(${parcelData.merchent.pickupPhone})"
//       ..merchantId = parcelData.merchent.id
//       ..deliveryTypeValue = parcelController.getDeliveryTypeName((parcelData.shipment?.shippingModeType??0));

//     _phoneTEController.text = parcelData.receiver.phone;
//     _addressTEController.text = parcelData.receiver.address;
//     _nameTEController.text = parcelData.receiver.name;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const HeaderText(title: "Pickup Zone information:"),
//         buildPickupZoneDropdown(),
//         const SizedBox(height: 10),
//         const HeaderText(title: "Receiver Information"),
//         buildReceiverInfo(),
//         const SizedBox(height: 10),
//         CustomInputField(
//           controller: _phoneTEController,
//           hintText: 'Receiver Phone',
//           icon: const Icon(Icons.phone),
//           onSavedForm: (newValue) => parcelDataController.phoneNumberValue = newValue,
//           validator: (String? value) {
//           if (value==null|| value.trim().isEmpty||_phoneTEController.text.length<10|| !_phoneTEController.text.isNumericOnly) {
//             return 'Enter Correct phone Number';
//           }
//           return null;
//         },
//         ),
//         const SizedBox(height: 10),
//         CustomInputField(
//           controller: _addressTEController,
//           hintText: 'Receiver Address',
//           icon: const Icon(Icons.location_on),
//           onSavedForm: (newValue) => parcelDataController.receiverAddressValue = newValue,
//         ),
//         const SizedBox(height: 10),
//         const HeaderText(title: "Delivery Information"),
//         buildDeliveryAreaDropdown(),
//         const SizedBox(height: 10),
//         buildDeliveryTypeDropdown(),
//         const SizedBox(height: 10),
//       ],
//     );
//   }

//   Widget buildPickupZoneDropdown() {
//     return CustomDropdownField(
//       hintText: 'Pickup Zone',
//       value: parcelDataController.pickupZoneValue,
//       icon: const Icon(Icons.local_taxi_rounded),
//       items: parcelController.pickupZones.map((zone) {
//         return DropdownMenuItem<String>(
//           value: zone,
//           child: Text(zone, overflow: TextOverflow.ellipsis),
//         );
//       }).toList(),
//       onChanged: (value) {
//         parcelDataController.pickupZoneValue = value;
//         parcelDataController.pickupZoneId = parcelController.getPickupZoneId(value!);
//       },
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please select your pickup Zone';
//         }
//         return null;
//       },
//     );
//   }

//   Widget buildReceiverInfo() {
//     return InputCard(
//       child: EasyAutocomplete(
//         controller: _nameTEController,
//         suggestions: parcelController.receiverNames,
//         decoration: const InputDecoration(
//           hintText: 'Receiver Name',
//           prefixIcon: Icon(Icons.person),
//           errorStyle: TextStyle(fontSize: 0),
               
//         ),
//         onChanged: (value) {
//           parcelDataController.nameValue = value;
//           var matchingReceivers = parcelController.parcelCreateRespone.data.receiver
//               .where((receiver) => receiver.name == parcelDataController.nameValue)
//               .toList();
//           if (matchingReceivers.isNotEmpty) {
//             final matchingReceiver = matchingReceivers.first;
//             parcelDataController
//               ..phoneNumberValue = matchingReceiver.phone
//               ..receiverAddressValue = matchingReceiver.address
//               ..receiverId = matchingReceiver.id;

//             _phoneTEController.text = matchingReceiver.phone;
//             _addressTEController.text = matchingReceiver.address;
//           }
//         },
//         validator: (String? value) {
//           if (value?.trim().isEmpty ?? true) {
//             return '';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   Widget buildDeliveryAreaDropdown() {
//     return CustomDropdownField(
//       hintText: 'Delivery Area',
//       value: parcelDataController.deliveryZoneValue,
//       icon: const Icon(Icons.location_city),
//       items: parcelController.deliveryZones.map((zone) {
//         return DropdownMenuItem<String>(
//           value: zone,
//           child: Text(zone, overflow: TextOverflow.ellipsis),
//         );
//       }).toList(),
//       onChanged: (value) {
//         parcelDataController.deliveryZoneValue = value;
//         parcelDataController.deliveryZoneId = parcelController.getDeliveryZoneId(value!);
//       },
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please select your delivery Zone';
//         }
//         return null;
//       },
//     );
//   }

//   Widget buildDeliveryTypeDropdown() {
//     return CustomDropdownField(
//       hintText: 'Delivery Type',
//       value: parcelDataController.deliveryTypeValue,
//       icon: const Icon(Icons.local_shipping),
//       items: parcelController.shippingMode.map((type) {
//         return DropdownMenuItem<String>(
//           value: type,
//           child: Text(type, overflow: TextOverflow.ellipsis),
//         );
//       }).toList(),
//       onChanged: (value) {
//         parcelDataController.deliveryTypeValue = value;
//         parcelDataController.deliveryTypeID = parcelController.shippingMode.indexOf(value!);
//       },
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please select your delivery type';
//         }
//         return null;
//       },
//     );
//   }
// }

// class CustomDropdownField extends StatelessWidget {
//   const CustomDropdownField({
//     super.key,
//     required this.hintText,
//     required this.items,
//     this.value,
//     this.icon,
//     this.headerText,
//     this.onChanged,
//     this.validator,
//   });

//   final String hintText;
//   final List<DropdownMenuItem<String>> items;
//   final String? value;
//   final Icon? icon;
//   final String? headerText;
//   final void Function(String?)? onChanged;
//   final String? Function(String?)? validator;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 3),
//       child: Column(
//         children: [
//           if (headerText != null) 
//             Row(
//               children: [
//                 Text(
//                   "$headerText:",
//                   style: AppTextStyle.darkGrey14Bold,
//                 ),
//               ],
//             ),
//           if (headerText != null) AppSizedBox.h5,
//           InputCard(
//             child: DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 labelText: hintText,
//                 prefixIcon: icon,
//               ),
//               value: value,
//               items: items,
//               onChanged: onChanged,
//               validator: validator,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
