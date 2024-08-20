import 'package:e_courier_360/data/utility/localization_key.dart';
import 'package:e_courier_360/presentation/state_holders/theme_controller.dart';
import 'package:e_courier_360/presentation/state_holders/translation_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/image_dropdown_field.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralSettingsScreen extends StatefulWidget {
  @override
  _GeneralSettingsScreenState createState() => _GeneralSettingsScreenState();
}

class _GeneralSettingsScreenState extends State<GeneralSettingsScreen> {
  bool isDarkTheme = false; // Example: Replace with your theme management
  String selectedLanguage = 'English'; // Example: Replace with your language management

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(LanKeys.settings.key.tr),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader(LanKeys.appearance.key.tr),
          _buildThemeSwitchTile(),
          _buildLanguageDropdownTile(),
          // const SizedBox(height: 20.0),
          // _buildSectionHeader('Account'),
          // _buildListTile(
          //   icon: Icons.person,
          //   title: 'Account Settings',
          //   onTap: () {
          //     // Navigate to account settings screen
          //   },
          // ),
          // _buildListTile(
          //   icon: Icons.security,
          //   title: 'Privacy & Security',
          //   onTap: () {
          //     // Navigate to privacy and security settings
          //   },
          // ),
          // const SizedBox(height: 20.0),
          // _buildSectionHeader('Notifications'),
          // _buildListTile(
          //   icon: Icons.notifications,
          //   title: 'Notification Settings',
          //   onTap: () {
          //     // Navigate to notification settings screen
          //   },
          // ),
          // _buildListTile(
          //   icon: Icons.logout,
          //   title: 'Logout',
          //   onTap: () {
          //     // Handle logout
          //   },
          // ),
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

  Widget _buildThemeSwitchTile() {
    return ListTile(
      leading: const Icon(Icons.brightness_6, color: AppColors.lightPrimaryColor),
      title:  Text(
        LanKeys.darkTheme.key.tr,
        style: TextStyle(fontSize: 16.0),
      ),
      trailing: Switch(
        value: Get.find<ThemeController>().isDarkMode.value,
        onChanged: (value) {
          setState(() {
            Get.find<ThemeController>().toggleTheme();
          });
        },
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
