import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';

class CredentialForm extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confimPasswordController;
  const CredentialForm({
    super.key,
    required this.passwordController,
    required this.confimPasswordController, 
  });

  @override
  State<CredentialForm> createState() => _CredentialFormState();
}

class _CredentialFormState extends State<CredentialForm> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.passwordController,
          hintText: 'Password',
          icon: const Icon(Icons.visibility),
          validator:(String? value ){
            if(value==null|| value.length<6){
              return 'Enter a strong password';
            }else{
              return null;
            }
          }
        ),
        AppSizedBox.h8,
        CustomInputField(
          controller: widget.confimPasswordController,
          hintText: 'Confirm Password',
          icon: const Icon(Icons.visibility),
          validator: (p0) {
           if(widget.passwordController.text!=widget.confimPasswordController.text){
              return 'Password doesn\'t match';
            }else{
              return null;
            }
          },
        ),
        AppSizedBox.h8,
      ],
    );
  }
}