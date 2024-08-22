import 'package:e_courier_360/data/models/rider.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/state_holders/rider_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/rider/rider_form.dart';

class RiderEditProfileScren extends StatefulWidget {
  const RiderEditProfileScren({super.key});

  @override
  State<RiderEditProfileScren> createState() => _RiderEditProfileScrenState();
}

class _RiderEditProfileScrenState extends State<RiderEditProfileScren> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<RiderController>()
          .getRiderDetails(AuthController.riderid!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CourierAppBar(title: "Profile"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GetBuilder<RiderController>(
          builder: (controller) {
            return controller.riderDetails == null
                ? const CenterCircularProgressIndicator()
                : RiderProfileEditScreen(
                    rider: controller.riderDetails!,
                  );
          }
        ),
      ),
    );
  }
}

class RiderProfileEditScreen extends StatefulWidget {
  const RiderProfileEditScreen({super.key, required this.rider});
  final Rider rider;
  @override
  State<RiderProfileEditScreen> createState() => _RiderProfileEditScreenState();
}

class _RiderProfileEditScreenState extends State<RiderProfileEditScreen> {
  final TextEditingController _fullNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _vehicleTypeTEController =
      TextEditingController();
  final TextEditingController _registrationNumberTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int? status;
  @override
  void initState() {
    _fullNameTEController.text = widget.rider.fullName;
    _emailTEController.text = widget.rider.email;
    _vehicleTypeTEController.text = widget.rider.vehicleType;
    _phoneTEController.text = widget.rider.phone;
    _addressTEController.text = widget.rider.address;
    _registrationNumberTEController.text = widget.rider.registrationNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                RiderForm(
                  fullNameController: _fullNameTEController,
                  emailController: _emailTEController,
                  phoneController: _phoneTEController,
                  addressController: _addressTEController,
                  vehicleTypeController: _vehicleTypeTEController,
                  registrationNumberController: _registrationNumberTEController,
                ),
                GetBuilder<RiderController>(builder: (controller) {
                  return SizedBox(
                    width: double.infinity,
                    child:controller.inProgress?const CenterCircularProgressIndicator():ElevatedButton(
                      onPressed: () async {
                        final result = await controller.updateProfile(
                          fullName: _fullNameTEController.text,
                          email: _emailTEController.text,
                          phone: _phoneTEController.text,
                          address: _addressTEController.text,
                          vehicleType: _vehicleTypeTEController.text,
                          registrationNumber:
                              _registrationNumberTEController.text,
                          riderId: widget.rider.id,
                        );

                        if (result) {
                          Get.snackbar(
                              "success", "Profile updated successfully");
                        } else {
                          Get.snackbar("Failed", "Failed to update profile");
                        }
                      },
                      child: const Text("Update"),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
