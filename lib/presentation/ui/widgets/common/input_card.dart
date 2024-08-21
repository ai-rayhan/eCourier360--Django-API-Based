import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  const InputCard({
    super.key, required this.child,
  });
final Widget child ;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 2,
          left: 12,
          right: 12,
          bottom: 2,
        ),
        decoration: BoxDecoration( color: Theme.of(context).cardTheme.color, borderRadius: BorderRadius.all(Radius.circular(8),),
         boxShadow:[BoxShadow(color: Theme.of(context).cardTheme.shadowColor!,blurRadius: 1,spreadRadius: 1)]),
        child: child);
  }
}