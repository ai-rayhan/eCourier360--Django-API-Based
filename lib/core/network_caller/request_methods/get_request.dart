import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:http/http.dart' as http;

import '../logger.dart';
import '../request_return_object.dart';

abstract class GetRequest {
  /// get api caller
  static Future<NetworkCallerReturnObject> execute(String url,
      {String? token, VoidCallback? onUnAuthorized}) async {
    try {
      Uri uri = Uri.parse(url);
      log("Request URL => $url");
      final request = http.MultipartRequest('GET', uri);
      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer ${AuthController.token}';
      final response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData =
            await response.stream.transform(utf8.decoder).join();
        final decodedJson = json.decode(responseData);
        logger.d(decodedJson);
        return NetworkCallerReturnObject(
            errorMessage: '',
            returnValue: decodedJson,
            success: true,
            responseCode: response.statusCode);
      } else if (response.statusCode == 401) {
        if (onUnAuthorized != null) onUnAuthorized();
        return NetworkCallerReturnObject(
            errorMessage: 'Response code ${response.statusCode}',
            returnValue: '',
            success: false,
            responseCode: response.statusCode);
      } else {
        final responseData =
            await response.stream.transform(utf8.decoder).join();
        final decodedJson = json.decode(responseData);
        logger.w(decodedJson);
        return NetworkCallerReturnObject(
            errorMessage: 'Response code ${response.statusCode}',
            returnValue: decodedJson,
            success: false,
            responseCode: response.statusCode);
      }
    } catch (e) {
      return NetworkCallerReturnObject(
          errorMessage: e.toString(),
          returnValue: "",
          success: false,
          responseCode: 400);
    }
  }
}
