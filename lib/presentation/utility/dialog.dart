import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String? content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CustomDialog({
    super.key,
    required this.title,
     this.content,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
           content!=null? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
            Text(content!),
            const SizedBox(height: 24.0),],):Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: onCancel,
                  child: const Text('Cancel'),
                ),
                const SizedBox(width:15.0),
                ElevatedButton(
                  onPressed: onConfirm,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8,),
                    child: Text('Confirm'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
onExitDialog(context){
  showDialog(
                context: context,
                builder: (BuildContext context) { 
                  return CustomDialog(title: "Are you sure to exit?", 
                   onConfirm: ()=>SystemNavigator.pop(),
                   onCancel: ()=> Get.back());});
}