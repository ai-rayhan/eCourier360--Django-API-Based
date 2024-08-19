import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

// class MyTranslations extends Translations {
//   Map<String, String> enTranslations = {};
//   // Map<String, String> esTranslations = {};
//   Map<String, String> bnTranslations = {};
//   // Map<String, String> arTranslations = {};

//   MyTranslations() {
//     loadTranslations();
//   }

//   void loadTranslations() async {
//     final enJson = await rootBundle.loadString('assets/language/en.json');
//     // final esJson = await rootBundle.loadString('assets/langs/es.json');
//     final bnJson = await rootBundle.loadString('assets/language/bn.json');
//     // final arJson = await rootBundle.loadString('assets/langs/ar.json');

//     enTranslations = Map<String, String>.from(json.decode(enJson));
//     // esTranslations = Map<String, String>.from(json.decode(esJson));
//     bnTranslations = Map<String, String>.from(json.decode(bnJson));
//     print(bnTranslations);
//     // arTranslations = Map<String, String>.from(json.decode(arJson));
//   }

//   @override
//   Map<String, Map<String, String>> get keys => {
//         'en_US': enTranslations,
//         // 'es_ES': esTranslations,
//         'bn_BD': bnTranslations,
//         // 'ar_SA': arTranslations,
//       };
// }
// class MyTranslations extends Translations {
//   static Map<String, String> enTranslations = {};
//   static Map<String, String> bnTranslations = {};

//   @override
//   Map<String, Map<String, String>> get keys => {
//         'en_US': enTranslations,
//         'bn_BD': bnTranslations,
//       };

//   static Future<void> loadTranslations() async {
//     enTranslations = await _loadJson('assets/language/en.json');
//     bnTranslations = await _loadJson('assets/language/bn.json');
//   }

//   static Future<Map<String, String>> _loadJson(String path) async {
//     final jsonString = await rootBundle.loadString(path);
//     return Map<String, String>.from(json.decode(jsonString));
//   }
// }


class MyTranslations extends Translations {
  static Map<String, String> enTranslations = {};
  static Map<String, String> bnTranslations = {};

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enTranslations,
        'bn_BD': bnTranslations,
      };

  static Future<void> loadTranslations() async {
    enTranslations = await _loadJson('assets/language/en.json');
    bnTranslations = await _loadJson('assets/language/bn.json');
  }

  static Future<Map<String, String>> _loadJson(String path) async {
    final jsonString = await rootBundle.loadString(path);
    return Map<String, String>.from(json.decode(jsonString));
  }
}
