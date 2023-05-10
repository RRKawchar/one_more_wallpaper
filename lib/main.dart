import 'package:flutter/material.dart';
import 'package:one_more_wallpaper/screens/bottom_nav_screens/home_screen.dart';
import 'package:one_more_wallpaper/screens/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const MainScreen(),
    );
  }
}


