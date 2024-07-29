import 'package:get/get.dart';

class TabNavigationController extends GetxController {
  //  late TabController _tabController;

  // // int _currentStep = 0;
  // // int get currentStep => _currentStep;

  // final List<String> _tabs = Get.find<DeliveryStatusController>().statusNames;
  // List<String>get tabs => _tabs;

  // initilizeTabController(){
  // _tabController.index = 3;
  // update();
  // }


 void dynamicNavigation(int index,tabController) {
     tabController.index = index;
     update();
  }



}
