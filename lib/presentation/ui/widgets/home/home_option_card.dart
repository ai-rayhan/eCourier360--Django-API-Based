
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';

class HomeOptionCard extends StatelessWidget {
  final String title;
  final IconData imagePath;
  final VoidCallback onTap;
  final double? height;
  final double? width;

  const HomeOptionCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,  this.height,  this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height,
      width: width,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration:appBoxDecoration(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.secondaryColor.withOpacity(.8),
                foregroundColor: AppColors.whiteColor,
                child: Icon(imagePath,size: 20,),),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    title,
                    // maxLines: 2,
                    style: AppTextStyle.darkGrey14Bold.copyWith(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 