import 'package:e_courier_360/presentation/state_holders/theme_controller.dart';
import 'package:e_courier_360/presentation/state_holders/translation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SystemConfigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text( 'dasad'.tr),
      ),
      body: ListView(
        children: [
          Center(
            child: Obx(() => Switch(
              value: themeController.isDarkMode.value,
              onChanged: (value) {
                themeController.toggleTheme();
              },
            )),
          ),
           ElevatedButton(
              onPressed: () {
                Get.find<TranslationController>().changeLocale( Locale('bn', 'BD'));
              },
              child: Text('Change to Bangla'),
            ),
           ElevatedButton(
              onPressed: () {
                Get.find<TranslationController>().changeLocale( Locale('en', 'US'));
              },
              child: Text('Change to Bangla'),
            ),
        ],
      ),
    );
  }
}