import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';
import 'package:get/get.dart';

class MerchantForm extends StatefulWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController shopNameController;
  final TextEditingController pickPhoneController;
  final TextEditingController shopAddressController;
  final TextEditingController pickupAddressController;

  const MerchantForm({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.shopNameController,
    required this.pickPhoneController,
    required this.shopAddressController,
    required this.pickupAddressController,

  });

  @override
  State<MerchantForm> createState() => _MerchantFormState();
}

class _MerchantFormState extends State<MerchantForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.fullNameController,
          hintText: 'Full name',
          icon: const Icon(Icons.near_me_rounded),
        ),
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.emailController,
          hintText: 'Email',
          icon: const Icon(Icons.email),
          validator:(String? value ){
            if(value==null|| !value.contains('@')||!value.contains('.')){
              return 'Enter valid Email address';
            }else{
              return null;
            }
          }
        ),
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.shopNameController,
          hintText: 'Shop name',
          icon: const Icon(Icons.storefront),
        ),
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.shopAddressController,
          hintText: 'Shop Address',
          icon: const Icon(Icons.location_on_outlined),
        ),
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.pickPhoneController,
          hintText: 'Pickup Phone',
          icon: const Icon(Icons.phone),
          validator:(String? value ){
            if(value==null|| !value.isNumericOnly||value.length<10){
              return 'Enter valid phone number';
            }else{
              return null;
            }
          }
        ),
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.pickupAddressController,
          hintText: 'Pickup Address',
          icon: const Icon(Icons.my_location),
        ),
        AppSizedBox.h8,
      ],
    );
  }
}
