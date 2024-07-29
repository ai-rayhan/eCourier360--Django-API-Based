import 'package:e_courier_360/data/models/local/onboarding_model.dart';
import 'package:e_courier_360/data/utility/assets_path.dart';

class QuickConfig{
 static String appName="E-Courier 360";//replace your actual app name

 static String slogan="Fast-Friendly-Flexible";//replace your actual app name

 static const String websiteUrl = 'http://leedaacademy.com'; // Replace your web URL
// (Note: You need to MUST Give here  web version of E-courier website URL For Combinationing API)

//To change logo to show in Splash,Signup,login And profile Screen .
//You need two Step to change this:
//1)Copy your logo and go project location like: your_project_path/multi_panel_courier_management_app
//2)then go multi_panel_courier_management_app/assets/images  folder and paste your logo
//3)add in below your logo name with Extension.like:logo.png
 static String logo="logo.png"; //replace your actual logo name 

 static String supportEmail="support@nextpagetl.com"; //replace your actual support Email
 
// To edit Onboarding screen images, header and description change this 
  static List<OnBoardingData> onBoardingList = [
    //this data will show on first onboard page
   OnBoardingData(
      imageUrl: AssetsPath.logo, // to change this image change image path from e_courier_360/data/utility/assets_path.dart
      title: 'Welcome..',
      description: 'A Fastest Courier Service',
    ),
      //this data will show on second onboard page
    OnBoardingData(
      imageUrl: AssetsPath.onboard2,
      title: "Service Time..",
      description: '24 Hours Seamless Service.',
    ),
      //this data will show on third onboard page
    OnBoardingData(
      imageUrl: AssetsPath.onboard3,
      title: 'Service Area..',
      description: 'Send Your Parcel, Over 120 Countries.',
    ),
    //this data will show on fourth onboard page
    OnBoardingData(
      imageUrl: AssetsPath.onboard4,
      title: 'Send Now..',
      description: 'Start Sending Your Parcel Anywhere.',
    ),
  ];

//If You need to change API URL To Connect your website. You must need Configure your website API endpoint and Request-Response as Our API Endpoint And Modelclass.
//Check For Details:
//API Endpoints:your_project_path/multi_panel_courier_management_app/lib/data/utility/urls.dart
//Model Classes:your_project_path/multi_panel_courier_management_app/lib/data/models/
//Also check:your_project_path/multi_panel_courier_management_app/lib/presentation/state_holders/


}

