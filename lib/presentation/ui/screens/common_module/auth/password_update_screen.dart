import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/app_logo.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/input_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String phoneNumber=Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 120),
                const AppLogo(height: 80),
                const SizedBox(height: 24.0),
                Text('Update Password', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 24.0),
                InputCard(
                  child: TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'New Password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a new password';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                InputCard(
                  child: TextFormField(
                    controller: _confirmPasswordTEController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Confirm Password'),
                    validator: (value) {
                      if (value != _passwordTEController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 24.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.find<AuthController>().changePassword(phoneNumber,_passwordTEController.text);
                        Get.snackbar('Success', 'Password updated successfully',
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                    child: const Text('Update Password'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
