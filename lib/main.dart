import 'package:device_preview/device_preview.dart';
import 'package:e_courier_360/app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Run the application with DevicePreview if needed(disabled for production)
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const ECourier360(),
    ),
  );
}
