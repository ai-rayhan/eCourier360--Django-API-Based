import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/auth/splash_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/app_logo.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationSubmittedScreen extends StatefulWidget {
  const ApplicationSubmittedScreen({super.key, });

  @override
  State<ApplicationSubmittedScreen> createState() => _ApplicationSubmittedScreenState();
}

class _ApplicationSubmittedScreenState extends State<ApplicationSubmittedScreen> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  IconButton(onPressed: (){
                    showCustomDialog(context: context,title: "Logout?",content: Text("Are you sure logout this account"),onSubmitPressed: () {
                    AuthController.clearAuthData();
                    Get.offAll(const SplashScreen());
                    },);
                  }, icon: const Icon(Icons.logout))
                  ,
                ],),
                const SizedBox(
                  height: 110,
                ),
                const AppLogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  'Application Sent To review',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
             
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                  child: Text(
                    'Your application is sent to Author.An admin will review your application and approve.After Approve by admin your App will redirect directly to home page.Thanks.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
               
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  width: double.infinity,
                  child:ElevatedButton(
                       onPressed: ()  {
                       Get.back();
                       Get.back();
                       },
                       child: const Text('OK'),
                     )
           
                ),
                const SizedBox(
                  height: 24,
                ),
              
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
