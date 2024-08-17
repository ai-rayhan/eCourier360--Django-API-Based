import 'package:e_courier_360/data/models/local/onboarding_model.dart';
import 'package:e_courier_360/presentation/state_holders/local/onboard_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/home/custom_onboard_button.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:e_courier_360/quick_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 1000,
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height - 350,
                child: Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primaryColor.withOpacity(.6),
                        AppColors.secondaryColor,
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 100,
                  width: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primaryColor.withOpacity(.6),
                        AppColors.secondaryColor,
                      ],
                    ),
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(100)),
                  ),
                ),
              ),
              const OnBoardingContent(),
            ],
          ),
        ),
      ),
    );
  }
}


class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
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
        const OnBoardingIndicator(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        const OnBoardingButtons(),
      ],
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
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
          child: Image.asset(
            data.imageUrl,
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
        Text(
          data.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.whiteColor),
          textAlign: TextAlign.center,
        ),
        AppSizedBox.h10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            data.description,
            style: const TextStyle(fontSize: 13, color: AppColors.whiteColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<OnBoardingController>(
      builder: (controller) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              QuickConfig.onBoardingList.length,
              (index) => Container(
                width: 7,
                height: 7,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: index == controller.selectedIndex
                      ? AppColors.secondaryColor
                      : Theme.of(context).disabledColor,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          );
      }
    );
    
  }
}

class OnBoardingButtons extends StatelessWidget {
  const OnBoardingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnBoardingController>();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: CustomOnboardButton(
              transparent: true,
              onPressed: () {
                if (controller.selectedIndex == QuickConfig.onBoardingList.length - 1) {
                  controller.navigateToLogin();
                } else {
                  controller.selectedIndex = QuickConfig.onBoardingList.length - 1;
                  controller.pageController.jumpToPage(QuickConfig.onBoardingList.length - 1);
                }
              },
              buttonText: controller.selectedIndex == QuickConfig.onBoardingList.length - 1 ? 'Login' : 'Skip',
            ),
          ),
          Expanded(
            child: CustomOnboardButton(
              buttonText: controller.selectedIndex != QuickConfig.onBoardingList.length - 1 ? 'Next' : 'Get Started',
              onPressed: () {
                if (controller.selectedIndex != QuickConfig.onBoardingList.length - 1) {
                  controller.pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.ease);
                } else {
                  controller.navigateToLogin();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}