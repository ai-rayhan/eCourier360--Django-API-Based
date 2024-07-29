import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';

class RiderForm extends StatefulWidget {
  final TextEditingController userNameController;
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController vehicleTypeController;
  final TextEditingController registrationNumberController;

  const RiderForm({
    super.key,
    required this.userNameController,
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
          controller: widget.userNameController,
          hintText: 'Username',
          icon: const Icon(Icons.account_circle_sharp),
        ),
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
          icon: const Icon(Icons.email),
        ),
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.phoneController,
          hintText: 'Phone',
          icon: const Icon(Icons.phone),
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
