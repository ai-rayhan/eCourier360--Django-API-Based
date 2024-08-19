import 'package:e_courier_360/data/models/receiver.dart';
import 'package:e_courier_360/presentation/state_holders/receiver_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReceiverScreen extends StatefulWidget {
  const AddReceiverScreen({super.key, this.receiver});
  final Receiver? receiver;

  @override
  State<AddReceiverScreen> createState() => _AddReceiverScreenState();
}

class _AddReceiverScreenState extends State<AddReceiverScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with existing receiver data if available
    _nameController = TextEditingController(text: widget.receiver?.name ?? '');
    _emailController = TextEditingController(text: widget.receiver?.email ?? '');
    _phoneController = TextEditingController(text: widget.receiver?.phone ?? '');
    _addressController = TextEditingController(text: widget.receiver?.address ?? '');
  }

  @override
  void dispose() {
    // Dispose of the controllers to avoid memory leaks
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CourierAppBar(title: "Add Receiver"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomInputField(
              hintText: "Name",
              controller: _nameController,
            ),
            CustomInputField(
              hintText: "Email",
              controller: _emailController,
            ),
            CustomInputField(
              hintText: "Phone",
              controller: _phoneController,
            ),
            CustomInputField(
              hintText: "Address",
              controller: _addressController,
            ),
            AppSizedBox.h10,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final name = _nameController.text;
                  final email = _emailController.text;
                  final phone = _phoneController.text;
                  final address = _addressController.text;
                  Get.find<ReceiverController>().addReceiver(name, phone,email, address);



                },
                child: const Text("Add Receiver"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
