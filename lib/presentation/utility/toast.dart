import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:e_courier_360/presentation/utility/app_colors.dart';

showToast(String msg,{ToastGravity? gravity}){
 return Fluttertoast.showToast(
        msg: msg,
        toastLength:  Toast.LENGTH_SHORT,
        gravity: gravity?? ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.primaryColor,
        textColor: Colors.white,
        fontSize: 13.0
    );
}