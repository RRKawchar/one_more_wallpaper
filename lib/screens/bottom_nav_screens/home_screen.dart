import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:one_more_wallpaper/widgets/custom_app_bar.dart';
import 'package:one_more_wallpaper/widgets/custom_carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(text1: "One More", text2: "Wallpaper"),
              const SizedBox(height: 20,),
              CustomCarouselSlider()
            ],
          ),
        ),
      ),
    );
  }
}
