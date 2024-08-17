import 'package:flutter/material.dart';

class CenterMediumOutlinedbutton extends StatelessWidget {
  const CenterMediumOutlinedbutton({
    super.key,
    required this.labelText,
    required this.icon,
    required this.onPressed,
  });
  final String labelText;
  final Icon icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280,
        child: OutlinedButton.icon(
            onPressed: onPressed, icon: icon, label: Text(labelText)),
      ),
    );
  }
}