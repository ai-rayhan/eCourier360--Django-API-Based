import 'dart:developer';

import 'package:flutter/material.dart';

class Sizefinder{
  static Size deviceSize(context){
  return MediaQuery.sizeOf(context);
  }
  static double deviceHeight(context){
    log(MediaQuery.sizeOf(context).height.toString());
  return MediaQuery.sizeOf(context).height;
  }
  static double deviceWidth(context){
  return MediaQuery.sizeOf(context).width;
  }
}