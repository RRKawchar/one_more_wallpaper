import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String text1;
  String text2;
  CustomAppBar({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: text1,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          children: [
            TextSpan(
                text: " $text2", style: const TextStyle(color: Colors.orange))
          ]),
    );
  }
}
