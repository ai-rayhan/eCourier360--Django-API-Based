import 'package:e_courier_360/presentation/state_holders/local/parcel_data_controller.dart';
import 'package:e_courier_360/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_courier_360/presentation/state_holders/stepper_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/add_merchant_screen/add_merchant_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/payment_screen/payment_screen.dart';
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
      title: "Add Merchant",
      imagePath: AssetsPath.personAdd,
      onTap: () {
        Get.to(const AddMerchantScreen());
      }),
  HomeOptionCard(
      title: "All Merchant",
      imagePath: AssetsPath.persons,
      onTap: () {
         Get.find<MainBottomNavController>().changeIndex(1);
      }),
  HomeOptionCard(
      title: "All Rider",
      imagePath: AssetsPath.rider,
      onTap: () {
        Get.to(const RidersScreen());
      }),
  HomeOptionCard(
      title: "Payment",
      imagePath: AssetsPath.payment,
      onTap: () {
        // Get.to(const AdminPaymentScreen());
      }),
];
