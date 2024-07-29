import 'package:flutter/material.dart';

class CustomOnboardButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final bool transparent;

  const CustomOnboardButton({
    super.key,
    this.onPressed,
    required this.buttonText,
    this.transparent = false,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: onPressed == null
          ? Theme.of(context).disabledColor
          : transparent
              ? Colors.transparent
              : Colors.transparent,
      minimumSize: const Size(300, 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: (buttonText == "Login" || buttonText == "Skip")
            ? const BorderSide(color: Colors.transparent)
            : BorderSide(
                color: Theme.of(context).textTheme.bodySmall?.color ??
                    Colors.white,
              ),
        borderRadius: BorderRadius.circular(5),
      ),
    );

    return Center(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: TextButton(
            onPressed: onPressed,
            style: flatButtonStyle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
