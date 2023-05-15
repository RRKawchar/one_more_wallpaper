
import 'package:flutter/material.dart';
import 'package:one_more_wallpaper/widgets/cutstom_text.dart';

class CustomArrowButton extends StatelessWidget {
  final String text;
  const CustomArrowButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: text,size: 20,fontWeight: FontWeight.bold,),

        const Icon(Icons.arrow_forward_ios_outlined,size: 18,color: Colors.grey,)
      ],
    );
  }
}
