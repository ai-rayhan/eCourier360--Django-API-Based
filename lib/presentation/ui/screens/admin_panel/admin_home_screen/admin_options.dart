import 'package:e_courier_360/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_courier_360/presentation/state_holders/merchant_controller.dart';
import 'package:e_courier_360/presentation/state_holders/parcel_data_controller.dart';
import 'package:e_courier_360/presentation/state_holders/rider_controller.dart';
import 'package:e_courier_360/presentation/state_holders/stepper_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/receiver_screen/receivers_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/riders_screen/riders_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/send_parcel_screen/send_parcel_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/home/home_option_card.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:get/get.dart';
List<HomeOptionCard> adminOptions = [
  HomeOptionCard(
      title: "Add Parcel",
      imagePath: AssetsPath.addParcel,
      onTap: () {
         Get.lazyPut<StepperController>(() => StepperController());
         Get.lazyPut<ParcelDataController>(() => ParcelDataController());
        Get.to(const SendPercelScreen());
      }),
  HomeOptionCard(
      title: "All Parcel",
      imagePath: AssetsPath.parcel,
      onTap: () {
        Get.find<MainBottomNavController>().changeIndex(2);
      }),
  HomeOptionCard(
      title: "Merchants",
      imagePath: AssetsPath.persons,
      onTap: () {
        Get.lazyPut<MerchantController>(() => MerchantController());
         Get.find<MainBottomNavController>().changeIndex(1);
      }),
      
  HomeOptionCard(
      title: "Riders",
      imagePath: AssetsPath.rider,
      onTap: () {
        Get.lazyPut<RiderController>(() => RiderController());
        Get.to(const RidersScreen());
      }),
  HomeOptionCard(
      title: "Receivers",
      imagePath: AssetsPath.persons,
      onTap: () {
        Get.to(const ReceiversScreen());
      }),

  HomeOptionCard(
      title: "Payment",
      imagePath: AssetsPath.payment,
      onTap: () {
        // Get.to(const AdminPaymentScreen());
      }),
];
