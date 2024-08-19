import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/state_holders/local/onboard_controller.dart';
import 'package:e_courier_360/routes/app_routes.dart';
import 'package:get/get.dart';

 void checkInitialRoute(){
  final OnBoardingController onboardController = Get.find<OnBoardingController>(); 
  final AuthController authController = Get.find<AuthController>(); 
      if (authController.isTokenNotNull && onboardController.isSeeOnboard && !authController.isPhoneVerifiedUser) {
        checkUserPanel();
    } 
    else if (authController.isTokenNotNull && onboardController.isSeeOnboard && !authController.isPhoneVerifiedUser) {
       Get.offAllNamed(RoutePath.verifyphone); 
    }else if (!authController.isTokenNotNull && onboardController.isSeeOnboard) {
       Get.offAllNamed(RoutePath.login); 
    } else {
       Get.offAllNamed(RoutePath.onboard);
    }
}

void checkUserPanel(){
  if(AuthController.userRole==1||AuthController.userRole==2){
    Get.offAllNamed(RoutePath.adminBottomNav);
  }
  else if(AuthController.userRole==3){
   Get.toNamed(RoutePath.merchantBottomNav);
  }
  else if(AuthController.userRole==4){
 Get.toNamed(RoutePath.riderBottomNav);
  }
  else{
    Get.toNamed(RoutePath.applicationInReview);
  }
}
