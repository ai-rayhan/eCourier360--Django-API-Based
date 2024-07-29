import 'package:e_courier_360/presentation/ui/widgets/common/app_logo.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 120,
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
                  'Your application is sent to Author.Please Wait a bit time we will contact with you',
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
    );
  }
}
