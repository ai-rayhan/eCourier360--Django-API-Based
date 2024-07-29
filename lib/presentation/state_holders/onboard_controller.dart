import 'package:e_courier_360/data/models/body/onboarding_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardController extends GetxController {
  bool _isSeeOnboard=false;
  bool get isSeeOnboard=>_isSeeOnboard;

  Future<void> saveSeeOnboard() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('seeOnboard',true);
  }
  Future<void> checkSeeOnboard() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _isSeeOnboard= sharedPreferences.getBool('seeOnboard')??false;
  }

   List<OnBoardingModel> _onBoardingList = [];
  List<OnBoardingModel> get onBoardingList => _onBoardingList;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  changeSelectIndex(int index) {
    _selectedIndex = index;
     update();
  }
}