import 'package:e_courier_360/data/models/local/onboarding_model.dart';
import 'package:e_courier_360/presentation/state_holders/local/onboard_controller.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:e_courier_360/quick_config.dart';
import 'package:e_courier_360/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        children: [
          GetBuilder<OnBoardingController>(
            builder: (controller) {
              return Expanded(
                child: PageView.builder(
                    itemCount: QuickConfig.onBoardingList.length,
                    controller: controller.pageController,
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (index) {
                      controller.updateIndex(index);
                    },
                    itemBuilder: (context, index) {
                      final data =QuickConfig.onBoardingList[index];
                      return OnBoardingPage(data: data);
                    },
                  ),
                
              );
            }
          ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => buildDot(index, context),
              ),
            ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          const OnBoardingButtons(),
        ],
            ),
      ),
    );
  }
}



class OnBoardingPage extends StatelessWidget {
  final OnBoardingData data;

  const OnBoardingPage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 3),
          height: 200,
          decoration: const BoxDecoration(borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            ),
            color: AppColors.secondaryColor,
            boxShadow: [BoxShadow(color: AppColors.secondaryColor,blurRadius: 42,spreadRadius: 10)]
          ),
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
            child: Image.asset(
              data.imageUrl,
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
        ),
        Text(
          data.title,
          style: const TextStyle(fontSize: 29,color:  AppColors.primaryColor,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        AppSizedBox.h10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            data.description,
            style: const TextStyle(fontSize: 20,color:  AppColors.primaryColor,fontWeight: FontWeight.bold)
            
            ,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
  Widget buildDot(int index, BuildContext context) {
    return GetBuilder<OnBoardingController>(
      builder: (controller) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 20,
          width: controller.selectedIndex == index ? 30 : 20,
          decoration: BoxDecoration(
            color: controller.selectedIndex == index ? AppColors.lightPrimaryColor : Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }
    );
  }
// class OnBoardingIndicator extends StatelessWidget {
//   const OnBoardingIndicator({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return GetBuilder<OnBoardingController>(
//       builder: (controller) {
//         return Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               QuickConfig.onBoardingList.length,
//               (index) => Container(
//                 width: 7,
//                 height: 7,
//                 margin: const EdgeInsets.only(right: 10),
//                 decoration: BoxDecoration(
//                   color: index == controller.selectedIndex
//                       ? AppColors.secondaryColor
//                       : Theme.of(context).disabledColor,
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//               ),
//             ),
//           );
//       }
//     );
    
//   }
// }

class OnBoardingButtons extends StatelessWidget {
  const OnBoardingButtons({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<OnBoardingController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                AnimatedButton(
                width:controller.selectedIndex != QuickConfig.onBoardingList.length - 1?80:0 ,
                height:controller.selectedIndex != QuickConfig.onBoardingList.length - 1?50:0,
                color: Colors.amber,
                child:  Text("Skip",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white),),
                onPressed: (){
                 controller.selectedIndex = QuickConfig.onBoardingList.length - 1;
                 controller.pageController.jumpToPage(QuickConfig.onBoardingList.length - 1);
                },
              ),
                AnimatedButton(
                width:controller.selectedIndex != QuickConfig.onBoardingList.length - 1?0:80 ,
                height:controller.selectedIndex != QuickConfig.onBoardingList.length - 1?0:50,
                color: AppColors.secondaryColor,
                child:  Text("Login",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white),),
                onPressed: (){
                 controller.navigateToLogin();
                },
              ),
             
              AppSizedBox.w14,
              AnimatedButton(
                width:controller.selectedIndex != QuickConfig.onBoardingList.length - 1?80:0 ,
                height:controller.selectedIndex != QuickConfig.onBoardingList.length - 1?50:0,
                color: AppColors.secondaryColor,
                child:  Text("Next",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white),),
                onPressed: (){
                  controller.pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.bounceOut);
                },
              ),
              AnimatedButton(
                width:controller.selectedIndex != QuickConfig.onBoardingList.length - 1?0:140 ,
                height:controller.selectedIndex != QuickConfig.onBoardingList.length - 1?0:50,
                color: AppColors.primaryColor,
                child:  Text("Guest Login",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white),),
                onPressed: () {
                  Get.offNamed(RoutePath.guestBottomNav);
                },
              ),
            
              //   :
              // Expanded(
              //   child: CustomOnboardButton(
              //     buttonText: controller.selectedIndex != QuickConfig.onBoardingList.length -1 ? 'Next' : 'Guest',
              //     onPressed: () {
              //       log(controller.selectedIndex.toString()+QuickConfig.onBoardingList.length.toString());
              //       if (controller.selectedIndex != QuickConfig.onBoardingList.length - 1) {
              //         controller.pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.ease);
              //       } else {
              //         Get.offNamed(RoutePath.guestBottomNav);
              //       }
              //     },
              //   ),
              // ),
            ],
          ),
        );
      }
    );
  }
}

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({
    super.key,  this.height=50,  this.width=80, required this.child,  this.onPressed,  this.color,
  }); 
  final double height;
  final double width;
  final Widget child;
  final Color? color;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onPressed,
      child: AnimatedContainer(
      width:width ,
      height:height,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: color),
        curve: Curves.ease,
        duration:const Duration(seconds: 1) ,
        child: Padding(padding: EdgeInsets.all(10),child: Center(child:child),)
        ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';



// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   _OnBoardingScreenState createState() => _OnBoardingScreenState();
// }

// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             _currentPage = index;
//           });
//         },
//         children: [
//           buildPage(
//             image: Lottie.asset('assets/animation1.json'),
//             title: "Welcome",
//             description: "Discover our app and explore its features.",
//             bgColor: Colors.blueAccent,
//           ),
//           buildPage(
//             image: Lottie.asset('assets/animation2.json'),
//             title: "Stay Connected",
//             description: "Communicate with your peers efficiently.",
//             bgColor: Colors.greenAccent,
//           ),
//           buildPage(
//             image: Lottie.asset('assets/animation3.json'),
//             title: "Achieve Goals",
//             description: "Track your progress and achieve your goals.",
//             bgColor: Colors.orangeAccent,
//           ),
//         ],
//       ),
//       bottomSheet: _currentPage != 2
//           ? BottomSheetWidget(
//               pageController: _pageController, currentPage: _currentPage)
//           : buildGetStartedButton(),
//     );
//   }

//   Widget buildPage({required Widget image, required String title, required String description, required Color bgColor}) {
//     return Container(
//       color: bgColor,
//       padding: EdgeInsets.all(40),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(height: 300, child: image),
//           SizedBox(height: 40),
//           Text(
//             title,
//             style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           SizedBox(height: 20),
//           Text(
//             description,
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 18, color: Colors.white70),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildGetStartedButton() {
//     return Container(
//       height: 80,
//       width: double.infinity,
//       color: Colors.orangeAccent,
//       child: Center(
//         child: TextButton(
//           onPressed: () {
//             // Navigate to the main app or login page
//           },
//           child: Text(
//             "Get Started",
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BottomSheetWidget extends StatelessWidget {
//   final PageController pageController;
//   final int currentPage;

//   const BottomSheetWidget({ Key? key, required this.pageController, required this.currentPage})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       color: Colors.white,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           TextButton(
//             onPressed: () {
//               pageController.previousPage(
//                   duration: Duration(milliseconds: 400), curve: Curves.ease);
//             },
//             child: Text(
//               currentPage == 0 ? "" : "Back",
//               style: TextStyle(color: Colors.blueAccent),
//             ),
//           ),
//           Row(
//             children: List.generate(
//               3,
//               (index) => buildDot(index, context),
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               pageController.nextPage(
//                   duration: Duration(milliseconds: 400), curve: Curves.ease);
//             },
//             child: Text(
//               currentPage == 2 ? "" : "Next",
//               style: TextStyle(color: Colors.blueAccent),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildDot(int index, BuildContext context) {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 300),
//       margin: EdgeInsets.symmetric(horizontal: 4),
//       height: 10,
//       width: currentPage == index ? 20 : 10,
//       decoration: BoxDecoration(
//         color: currentPage == index ? Colors.blueAccent : Colors.grey,
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );
//   }
// }
