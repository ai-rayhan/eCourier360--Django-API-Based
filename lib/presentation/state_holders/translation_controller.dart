import 'dart:developer';

import 'package:e_courier_360/data/helper/language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslationController extends GetxController {

  final _locale = Rx<Locale>(const Locale('en', 'US'));

  Locale get locale => _locale.value;
  void changeLocale(Locale value) {
    _locale.value = value;
     Get.updateLocale(value);
     log(locale.languageCode);
    _saveLocaleToPrefs(value);
  }

  @override
  void onInit() {
    super.onInit();
    _loadLocaleFromPrefs();
  }

  Future<void> _loadLocaleFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language_code') ?? 'en';
    final countryCode = prefs.getString('country_code') ?? 'US';
    _locale.value = Locale(languageCode, countryCode);
    await MyTranslations.loadTranslations();
  }

  Future<void> _saveLocaleToPrefs(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', locale.languageCode);
    await prefs.setString('country_code', locale.countryCode ?? 'US');
  }
}
