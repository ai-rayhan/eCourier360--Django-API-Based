import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';
import 'package:get/get.dart';

class RiderForm extends StatefulWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController vehicleTypeController;
  final TextEditingController registrationNumberController;

  const RiderForm({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.phoneController,
    required this.addressController,
    required this.vehicleTypeController,
    required this.registrationNumberController,
  });

  @override
  State<RiderForm> createState() => _RiderFormState();
}

class _RiderFormState extends State<RiderForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.fullNameController,
          hintText: 'Full Name',
          icon: const Icon(Icons.near_me_rounded),
        ),
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.emailController,
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
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
          controller: widget.phoneController,
          hintText: 'Phone',
          icon: const Icon(Icons.phone),
          keyboardType: TextInputType.phone,
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
          controller: widget.addressController,
          hintText: 'Address',
          icon: const Icon(Icons.location_on_outlined),
        ),
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.vehicleTypeController,
          hintText: 'Vehicle Type',
          icon: const Icon(Icons.directions_car_rounded),
        ),
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.registrationNumberController,
          hintText: 'Registration Number',
          icon: const Icon(Icons.confirmation_number),
        ),
        AppSizedBox.h8,
      
      ],
    );
  }
}
