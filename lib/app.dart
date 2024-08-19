
import 'package:e_courier_360/controller_binder.dart';
import 'package:e_courier_360/data/helper/language.dart';
import 'package:e_courier_360/presentation/state_holders/translation_controller.dart';
import 'package:e_courier_360/presentation/utility/app_theme_data.dart';
import 'package:e_courier_360/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ECourier360 extends StatelessWidget {
  const ECourier360({super.key});

  @override
  Widget build(BuildContext context) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemeData.lightThemData,
            darkTheme: AppThemeData.darkThemeData,
            themeMode: ThemeMode.system,
            translations: MyTranslations(),
            locale: Get.find<TranslationController>().locale,
            fallbackLocale: const Locale('en', 'US'),
            initialRoute: '/',
            getPages: AppPages.routes,
            initialBinding: ControllerBinder(),
            builder: EasyLoading.init(),
          );
  }
}