import 'package:flutter/material.dart';
import 'package:one_more_wallpaper/screens/wallpapers/Aesthetic_wallpapers.dart';
import 'package:one_more_wallpaper/screens/wallpapers/abstract_wallpaper.dart';
import 'package:one_more_wallpaper/screens/wallpapers/top_wallpapers.dart';
import 'package:one_more_wallpaper/utils/custom_arrow_button.dart';
import 'package:one_more_wallpaper/widgets/custom_app_bar.dart';
import 'package:one_more_wallpaper/utils/custom_carousel_slider.dart';
import 'package:one_more_wallpaper/widgets/cutstom_text.dart';

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
              const SizedBox(height: 20,),
              CustomAppBar(text1: "Wall", text2: "Papers"),
              const SizedBox(height: 20,),
              const CustomCarouselSlider(),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: const [
                    CustomArrowButton(text: 'Top Wallpapers'),
                    SizedBox(height: 20,),
                    TopWallpapers(),
                    SizedBox(height: 20,),
                    CustomArrowButton(text: 'Abstract'),
                    SizedBox(height: 25,),
                    AbstractWallpaper(),
                    SizedBox(height: 25,),
                    CustomArrowButton(text: 'Aesthetic'),
                    SizedBox(height: 25,),
                    AestheticWallpapers(),
                    SizedBox(height: 10,),

                  ],
                ),
              )



            ],
          ),
        ),
      ),
    );
  }
}
