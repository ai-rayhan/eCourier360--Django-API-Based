import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final Widget? content;
  final VoidCallback? onSubmitPressed;

  const CustomDialog({super.key, 
    required this.title,
    this.onSubmitPressed, 
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child:Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15.0),
          content??Container(),
          const SizedBox(height: 22.0),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: ()=>Navigator.pop(context),
                  child: const Text('Cancel'),
                  style:  TextButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 150, 143, 172).withOpacity(.5),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        textStyle: const TextStyle(fontSize: 15, letterSpacing: 0.5,fontWeight: FontWeight.w600,fontFamily: 'Poppins'),
        foregroundColor: Colors.white,
      ),
                ),
                const SizedBox(width:15.0),
                ElevatedButton(
                  onPressed: (){
                      Navigator.of(context).pop();
                      if (onSubmitPressed != null) {
                        onSubmitPressed!();
                      }
                    },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,),
                    child: Text('OK'),
                  ),
                  style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
                ),
              ],
            ),
          // ElevatedButton( 
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //     if (onSubmitPressed != null) {
          //       onSubmitPressed!();
          //     }
          //   },
          //   child: Text(
          //     'OK',
          //     style: TextStyle(fontSize: 18.0),
          //   ),
          //   style: ElevatedButton.styleFrom(
          //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(8.0),
          //     ),
          //   ),
          // ),
        ],
      ),
    )
    );
  }
}

void showCustomDialog({
  required BuildContext context,
  required String title,
  Widget? content,
  VoidCallback? onSubmitPressed,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog(
        title: title,
        content: content,
        onSubmitPressed: onSubmitPressed,
      );
    },
  );
}
