import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';

class MerchantForm extends StatefulWidget {
  final TextEditingController userNameController;
  final TextEditingController fullNameController;
  final TextEditingController shopEmailController;
  final TextEditingController shopNameController;
  final TextEditingController pickPhoneController;
  final TextEditingController shopAddressController;
  final TextEditingController pickupAddressController;

  const MerchantForm({
    super.key,
    required this.userNameController,
    required this.fullNameController,
    required this.shopEmailController,
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
          controller: widget.userNameController,
          hintText: 'Username',
          icon: const Icon(Icons.account_circle_sharp),
        ),
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.fullNameController,
          hintText: 'Full name',
          icon: const Icon(Icons.near_me_rounded),
        ),
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.shopNameController,
          hintText: 'Shop name',
          icon: const Icon(Icons.storefront),
        ),
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.shopEmailController,
          hintText: 'Shop Email',
          icon: const Icon(Icons.email),
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
