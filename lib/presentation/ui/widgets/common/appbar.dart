
import 'package:flutter/material.dart';

class CourierAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? leadingOnPressed;

  const CourierAppBar({
    super.key, 
    required this.title, this.bottom,  this.leadingOnPressed,
  });
final PreferredSizeWidget? bottom;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      leading: IconButton(
        onPressed:leadingOnPressed??()=>Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
      ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(bottom==null?kTextTabBarHeight: (kToolbarHeight*2)-20);
}
