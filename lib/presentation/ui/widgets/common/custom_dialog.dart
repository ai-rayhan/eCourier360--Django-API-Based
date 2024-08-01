import 'package:flutter/material.dart';

class InputDialog extends StatelessWidget {
  final String title;
  final Widget? content;
  final VoidCallback? onSubmitPressed;

  InputDialog({
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
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 10),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 15.0),
          content??Container(),
          SizedBox(height: 22.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (onSubmitPressed != null) {
                onSubmitPressed!();
              }
            },
            child: Text(
              'OK',
              style: TextStyle(fontSize: 18.0),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    )
    );
  }
}

void showInputDialog({
  required BuildContext context,
  required String title,
  Widget? content,
  VoidCallback? onSubmitPressed,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return InputDialog(
        title: title,
        content: content,
        onSubmitPressed: onSubmitPressed,
      );
    },
  );
}
