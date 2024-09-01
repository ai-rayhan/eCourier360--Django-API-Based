
import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/utility/box_decoration.dart';
import 'package:e_courier_360/presentation/utility/size.dart';
import 'package:e_courier_360/presentation/utility/text_style.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key, required this.status, required this.count, required this.countColor, required this.icon,
  });
final String status;
final String count;
final Color countColor;
// final String image;
final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            width: Sizefinder.deviceWidth(context)/4.6,
            height: 70,
            decoration: appBoxDecoration(context),
            child:  
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                // Image.network(image,height: 35,width: 35,),
                SizedBox(
                  child: icon
                  ),
                Text(status,style: AppTextStyle.darkGrey13Bold.copyWith(fontSize: 11),maxLines: 1,overflow: TextOverflow.ellipsis,),
              ],),
            ),
          ),
          Positioned(
            left:  45,
            child: Container(
              decoration: BoxDecoration(color: countColor,borderRadius: BorderRadius.circular(5)),
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(count,style: AppTextStyle.darkGrey13Bold.copyWith(color: Colors.white),),
              )))
        ],
      ),
    );
  }
}
