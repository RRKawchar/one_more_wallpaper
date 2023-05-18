import 'package:flutter/material.dart';
import 'package:one_more_wallpaper/screens/wallpapers/top_wallpapers.dart';
import 'package:one_more_wallpaper/utils/custom_arrow_button.dart';
import 'package:one_more_wallpaper/utils/custom_carousel_slider.dart';

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
              Image.asset("assets/image/app_logo.png",width: 200,),
              const CustomCarouselSlider(),
              const SizedBox(height: 20,),
              const CustomArrowButton(text: 'Top Wallpapers'),
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TopWallpapers(),
              ),
              const SizedBox(height: 20,),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Column(
              //     children: const [
              //       CustomArrowButton(text: 'Top Wallpapers'),
              //       SizedBox(height: 20,),
              //       TopWallpapers(),
              //       SizedBox(height: 20,),
              //
              //     ],
              //   ),
              // )



            ],
          ),
        ),
      ),
    );
  }
}
