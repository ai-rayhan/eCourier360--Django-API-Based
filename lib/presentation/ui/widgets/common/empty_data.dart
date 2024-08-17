import 'package:flutter/material.dart';
import 'package:e_courier_360/data/utility/assets_path.dart';

class EmptyDataPage extends StatelessWidget {
  const EmptyDataPage({super.key,  this.msg});
  final String? msg;
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset(AssetsPath.wentWrong,height: 150,width: 150,),
      Center(child: Text(msg ??"No Data Found",style: Theme.of(context).textTheme.titleLarge,),),
      const SizedBox(height: 50,)
    ],),);
  }
}