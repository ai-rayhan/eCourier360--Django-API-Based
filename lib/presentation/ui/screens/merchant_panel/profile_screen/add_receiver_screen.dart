import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';
import 'package:flutter/material.dart';

class AddReceiverScreen extends StatefulWidget {
  const AddReceiverScreen({super.key});

  @override
  State<AddReceiverScreen> createState() => _AddReceiverScreenState();
}

class _AddReceiverScreenState extends State<AddReceiverScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CourierAppBar(title: "Add Receiver"),
      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        const CustomInputField(hintText: "Name"),
        const CustomInputField(hintText: "Email"),
        const CustomInputField(hintText: "Phone"),
        const CustomInputField(hintText: "Address"),
        AppSizedBox.h10,
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: (){}, child: const Text("Add Receiver")))
      ],),
    ),);
  }
}