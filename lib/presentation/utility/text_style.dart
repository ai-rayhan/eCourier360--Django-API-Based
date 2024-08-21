import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';

class AppTextStyle{
  static TextStyle primary14w600=TextStyle(fontSize: 14,color: AppColors.lightPrimaryColor,fontFamily: FontFamily.popins,fontWeight: FontWeight.w500);
 
  static TextStyle theme13=TextStyle(fontSize: 13,fontFamily: FontFamily.popins);
  static TextStyle theme16w600=TextStyle(fontSize: 16,fontFamily: FontFamily.hindSiliguri,fontWeight: FontWeight.w600);

  static TextStyle grey14=TextStyle(fontSize: 14,color: Colors.grey,fontFamily: FontFamily.popins);
  static TextStyle darkGrey13Bold=TextStyle(fontSize: 13,fontFamily: FontFamily.popins,fontWeight: FontWeight.w500,color: Colors.grey[600]);
  static TextStyle darkGrey14Bold=TextStyle(fontSize: 14,fontFamily: FontFamily.popins,fontWeight: FontWeight.w500,color: Colors.grey[600]);
  static TextStyle darkGrey15Bold=TextStyle(fontSize: 15,fontFamily: FontFamily.popins,fontWeight: FontWeight.w500,color: Colors.grey[600]);
  static TextStyle darkGrey16Bold=TextStyle(fontSize: 16,fontFamily: FontFamily.popins,fontWeight: FontWeight.w500,color: Colors.grey[600]);
  static TextStyle darkgrey13=TextStyle(fontSize: 13,color: Colors.grey[700],fontFamily: FontFamily.popins);
}

class FontFamily {
  static String hindSiliguri='HindSiliguri';
  static String popins='Poppins';
  }