import 'package:e_courier_360/presentation/utility/box_decoration.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? trailing;
  final Widget? leading;
  final VoidCallback? onTap;

  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
     this.trailing,
     this.leading, this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: AppBoxDecoration.whiteDecoration,
        child: ListTile(
          title: Text(title,maxLines: 2,overflow: TextOverflow.ellipsis),
          subtitle: Text(subtitle,maxLines: 3,overflow: TextOverflow.ellipsis,),
          leading: leading,
          trailing: trailing,
          onTap: onTap,
        ),
      ),
    );
  }
}
