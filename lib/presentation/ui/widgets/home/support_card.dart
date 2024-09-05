import 'package:e_courier_360/data/helper/url_launcher.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';
import 'package:e_courier_360/quick_config.dart';

class SupportCard extends StatelessWidget {
  const SupportCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppUrlLauncher.openEmail(QuickConfig.supportEmail),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: appBoxDecoration(context),
          child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [Image.asset(AssetsPath.support, width: 50,
          height: 50,color: AppColors.lightPrimaryColor,) ,
          const SizedBox(width: 15,),
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Need help?",style: AppTextStyle.darkGrey14Bold,),
              const Text("Contact with  Support"),
            ],
          )]),
        ),),
      ),
    );
  }
}