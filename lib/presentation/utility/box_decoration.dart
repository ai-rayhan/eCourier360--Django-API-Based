import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';

class AppBoxDecoration{
  static BoxDecoration whiteDecoration=  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(14),),border: Border.all(width: 1,color: AppColors.lightPrimaryColor.withOpacity(.3)),
        boxShadow:[BoxShadow(color: Color(0xFFE6E6E6),blurRadius: 5,spreadRadius: 1),
        ]);
      // static BoxDecoration whiteDecoration=  BoxDecoration(color: const Color.fromARGB(255, 95, 95, 95), borderRadius: BorderRadius.all(Radius.circular(14),),border: Border.all(width: 1,color: AppColors.lightPrimaryColor.withOpacity(.3)),
      //   boxShadow:[BoxShadow(color: Color.fromARGB(255, 196, 196, 196),blurRadius: 5,spreadRadius: 1),
      //   ]);
  static BoxDecoration whiteBlueDecoration= const BoxDecoration(color: Color.fromARGB(255, 209, 198, 245), borderRadius: BorderRadius.all(Radius.circular(14),),
        boxShadow:[BoxShadow(color: Color(0xFFE6E6E6),blurRadius: 1,spreadRadius: 1),
        ]);
}