import 'package:device_preview/device_preview.dart';
import 'package:e_courier_360/app.dart';
import 'package:e_courier_360/presentation/state_holders/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ThemeController themeController = Get.put(ThemeController());
  await themeController.loadThemeStatus();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const ECourier360(),
    ),
  );
}
