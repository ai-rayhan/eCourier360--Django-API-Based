
import 'package:flutter/material.dart';

class SpaceBetweenRow extends StatelessWidget {
 final String  title;
  final String value;
  const SpaceBetweenRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(title),
      Text(value)
    ],);
  }
}