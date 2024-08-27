import 'dart:async';

import 'package:get/get.dart';

class OtpTimeDecreaseController extends GetxController {
  int countdown = 60;
  bool buttonEnabled = false;
  late Timer timer;

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      countdown--;
      update();
      if (countdown <= 0) {
        buttonEnabled = true;
        timer.cancel();
        update();
      }
    });
  }


  void countStart() {
    if (countdown == 0) {
      countdown=60;
      buttonEnabled = false;
      update();
    }
  }
}