import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/input_card.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';

class CredentialForm extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confimPasswordController;
  final Function(int index, String value) onStatusChanged;
  final int statusId;
  const CredentialForm({
    super.key,
    required this.passwordController,
    required this.confimPasswordController, 
    required this.onStatusChanged, required this.statusId,
  });

  @override
  State<CredentialForm> createState() => _CredentialFormState();
}

class _CredentialFormState extends State<CredentialForm> {
  List<String> statuses = ["Approved", "Pending", "Cancel"];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSizedBox.h8,
        InputCard(
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Pickup Zone',
              prefixIcon: Icon(Icons.local_taxi_rounded),
            ),
            value: statuses[widget.statusId-1],
            // value:pickUpZoneController.getPickupZoneById(widget.parcel?.pickupZone??0)?.name,
            items: statuses.map((level) {
              return DropdownMenuItem<String>(
                value: level,
                child: Text(
                  level,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: (value) {
              int index = statuses.indexOf(value!);
              widget.onStatusChanged(index, value); 
            },
          ),
        ),
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.passwordController,
          hintText: 'Password',
          icon: const Icon(Icons.visibility),
        ),
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.confimPasswordController,
          hintText: 'Confirm Password',
          icon: const Icon(Icons.visibility),
        ),
        AppSizedBox.h8,
      ],
    );
  }
}