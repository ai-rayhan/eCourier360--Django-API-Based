import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/input_card.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';
import 'package:e_courier_360/presentation/utility/text_style.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    this.controller,
    this.initialValue,
    required this.hintText,
    this.canblank,
    this.icon, this.headerText,  this.onSavedForm, this.onChangedForm, this.enabled, this.validator, this.keyboardType, this.textInputAction, this.suffixIcon, this.obscureText,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final Icon? icon;
  final String hintText;
  final bool? canblank;
  final String? Function(String?)? validator;
  final String? headerText;
  final bool? enabled;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onSavedForm;
  final void Function(String)? onChangedForm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Column(
        children: [
          if (headerText != null) 
            Row(
              children: [
                Text(
                  "$headerText:",
                  style: AppTextStyle.darkGrey14Bold,
                ),
              ],
            ),
            if (headerText != null) AppSizedBox.h5,
          InputCard(
            child: TextFormField(
              controller: controller,
              enabled: enabled??true,
              initialValue: initialValue,
              keyboardType: keyboardType,
              textInputAction: textInputAction??TextInputAction.next,
              obscureText:obscureText??false,
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                errorMaxLines: 1,
                errorStyle: TextStyle(fontSize: 12),
                labelText: hintText,
                hintText: hintText,
                prefixIcon: icon,
              ),
              style: TextStyle(fontSize: 14),
              validator: validator ??(value) {
                if (canblank ?? false) {
                  return null;
                }else if(value?.isEmpty ?? true){
                  return 'Enter $hintText';
                }
                
                return null;
                
              },
              onSaved: (newValue) {
                if (newValue != null&&onSavedForm!=null) {
                  onSavedForm!(newValue);
                }
              },
              onChanged: onChangedForm,
            ),
          ),
        ],
      ),
    );
  }
}
onlyNumeric(String? value){
  if (double.tryParse(value??'')!=null) {
     return  'Numeric required';
   }
}