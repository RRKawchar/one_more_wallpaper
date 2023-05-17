import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void nextPage({Widget? page, BuildContext? context}){
  Navigator.push(context!, MaterialPageRoute(builder: (_)=>page!));
}

void nextPageOnly({Widget? page, BuildContext?context}){
  Navigator.pushAndRemoveUntil(context!, CupertinoPageRoute(builder: (_)=>page!), (route) => false);
}