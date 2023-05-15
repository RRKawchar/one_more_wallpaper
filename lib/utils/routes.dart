import 'package:flutter/material.dart';

void nextPage({Widget? page, BuildContext? context}){
  Navigator.push(context!, MaterialPageRoute(builder: (_)=>page!));
}