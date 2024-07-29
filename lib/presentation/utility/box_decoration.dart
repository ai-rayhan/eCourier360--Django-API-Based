import 'package:flutter/material.dart';

class AppBoxDecoration{
  static BoxDecoration whiteDecoration= const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(14),),
        boxShadow:[BoxShadow(color: Color(0xFFE6E6E6),blurRadius: 5,spreadRadius: 1),
        ]);
  static BoxDecoration whiteBlueDecoration= const BoxDecoration(color: Color.fromARGB(255, 209, 198, 245), borderRadius: BorderRadius.all(Radius.circular(14),),
        boxShadow:[BoxShadow(color: Color(0xFFE6E6E6),blurRadius: 1,spreadRadius: 1),
        ]);
}