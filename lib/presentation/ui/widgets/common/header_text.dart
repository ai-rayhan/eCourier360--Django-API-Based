
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key, required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        children: [
          Text(title,
              style: TextStyle(
                  fontFamily: FontFamily.popins,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                  ,color: const Color.fromARGB(255, 63, 63, 63)

                  )),
        ],
      ),
    );
  }
}