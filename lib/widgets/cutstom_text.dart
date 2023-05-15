import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  FontWeight? fontWeight;
  Color? textColor;
  double? size;
  double? letterSpacing;
  CustomText(
      {Key? key,
      required this.text,
      this.textColor,
      this.fontWeight,
      this.letterSpacing,
      this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: size,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,),
    );
  }
}
