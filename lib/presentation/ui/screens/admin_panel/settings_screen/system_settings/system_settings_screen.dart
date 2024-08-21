import 'package:e_courier_360/data/utility/localization_key.dart';
import 'package:e_courier_360/presentation/state_holders/sms_provider_controller.dart';
import 'package:e_courier_360/presentation/state_holders/translation_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/settings_screen/system_settings/sms_setup/sms_setup_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/image_dropdown_field.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SystemSettingsScreen extends StatefulWidget {
  @override
  _SystemSettingsScreenState createState() => _SystemSettingsScreenState();
}

class _SystemSettingsScreenState extends State<SystemSettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(LanKeys.settings.key.tr),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader(LanKeys.paymentMethod.key.tr),
       
          _buildListTile(
            icon: Icons.sms,
            title: 'SMS Setup',
            onTap: () {
              Get.lazyPut<SmsProviderController>(() => SmsProviderController());
              Get.to(SmsSettingsPage());
            },
          ),
          const SizedBox(height: 20.0),
          _buildListTile(
            icon: Icons.paypal_outlined,
            title: 'Payment Getway',
            onTap: () {
            },
          ),
          _buildListTile(
            icon: Icons.payment_sharp,
            title: 'Payment Methods',
            onTap: () {

            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: AppColors.lightPrimaryColor,
        ),
      ),
    );
  }

  Widget _buildLanguageDropdownTile() {
    return  ListTile(
      leading: const Icon(Icons.language, color: AppColors.lightPrimaryColor),
      title:  Text(
        LanKeys.language.key.tr,
        style: TextStyle(fontSize: 16.0),
      ),
      trailing: ImageDropdownButton(
        initialItem: Get.find<TranslationController>().locale.countryCode=='US'? 'English':'বাংলা', items: const [
         {
          'value':'English',
          'image':AssetsPath.usFlag
        },
        {
          'value':'বাংলা',
          'image':AssetsPath.bdFlag
        }

      ],
      onChanged: (value) {
          Get.find<TranslationController>().changeLocale(value=='English'? const Locale('en', 'US'): const Locale('bn', 'BD'));
   
      },
      ),
    
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.lightPrimaryColor),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16.0),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onTap,
    );
  }
}
