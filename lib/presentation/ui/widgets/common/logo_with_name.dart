import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/app_logo.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';
import 'package:e_courier_360/quick_config.dart';

class LogoWithName extends StatelessWidget {
  const LogoWithName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [ const SizedBox(
       height: 30,
     ),
      AppSizedBox.w10,
      const Center(child:
       Padding(
        padding: EdgeInsets.all(8.0),
        child: AppLogo(height: 80,width: 80,),
             )),
      AppSizedBox.h5,
      Text(QuickConfig.appName,style: Theme.of(context).textTheme.titleLarge,),
       AppSizedBox.h10,
                   ],);
  }
}