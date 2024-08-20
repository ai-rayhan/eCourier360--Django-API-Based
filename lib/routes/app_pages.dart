
import 'package:e_courier_360/presentation/bindings/add_parcel_binding.dart';
import 'package:e_courier_360/presentation/bindings/bottomnav_binding.dart';
import 'package:e_courier_360/presentation/bindings/otp_bindings.dart';
import 'package:e_courier_360/presentation/bindings/splash_binding.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/bottom_navigation_bar/admin_bottom_navigation_bar.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/auth/application_submitted_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/auth/login_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/auth/splash_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/auth/verify_otp_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/auth/verify_phone_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/onboard/onboard_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/parcels/parcels_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel/send_parcel_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/merchant_panel/bottom_navigationbar/merchant_bottom_navbar.dart';
import 'package:e_courier_360/presentation/ui/screens/rider_panel/bottom_navigationbar/rider_bottom_navbar.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
      name: RoutePath.initial,
      page: () => const SplashScreen(),
      binding: OnboardBinding()
    ),
    GetPage(
      name: RoutePath.onboard,
      page: () => const OnBoardingScreen(),
      binding: OnboardBinding()
    ),
    GetPage(
      name: RoutePath.login,
      page: () => const LoginScreen(),
      binding: OnboardBinding()
    ),
    // GetPage(
    //   name: RoutePath.signup,
    //   page: () => const SignupScreen(),
    // ),
    GetPage(
      name: RoutePath.verifyOtp,
      page: () => const VerifyOTPScreen(),
      binding: SendOTPBinding()
    ),
    GetPage(
      name: RoutePath.verifyphone,
      page: () => const VerifyPhoneScreen(),
      binding: SendOTPBinding()
    ),
    GetPage(
      name: RoutePath.applicationInReview,
      page: () => const ApplicationInReviewScreen(),
    ),
    GetPage(
      name: RoutePath.adminBottomNav,
      page: () => const AdminBottomNavigationBar(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: RoutePath.merchantBottomNav,
      page: () => const MerchantBottomNavigationBar(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: RoutePath.riderBottomNav,
      page: () => const RiderBottomNavigationBar(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: RoutePath.sendParcel,
      page: () => const SendPercelScreen(),
      binding: SendParcelBinding()
    ),
    GetPage(
      name: RoutePath.sendParcel,
      page: () => const ParcelsTrackScreen(),
      binding: SendParcelBinding()
    ),
  ];
}
