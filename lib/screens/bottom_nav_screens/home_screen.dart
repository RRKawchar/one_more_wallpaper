import 'package:flutter/material.dart';
import 'package:one_more_wallpaper/screens/wallpapers/Aesthetic_wallpapers.dart';
import 'package:one_more_wallpaper/screens/wallpapers/abstract_wallpaper.dart';
import 'package:one_more_wallpaper/screens/wallpapers/cold_play_wallpaper.dart';
import 'package:one_more_wallpaper/screens/wallpapers/nature_wallpapers.dart';
import 'package:one_more_wallpaper/screens/wallpapers/night_wallpapers.dart';
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
              Image.asset("assets/image/logo.png",width: 200,),
              // CustomAppBar(text1: "Wall", text2: "Papers"),
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
                    SizedBox(height: 25,),
                    CustomArrowButton(text: 'Cold Play'),
                    SizedBox(height: 25,),
                    ColdPlayWallpapers(),
                    SizedBox(height: 25,),
                    CustomArrowButton(text: 'Nature'),
                    SizedBox(height: 25,),
                    NatureWallpapers(),
                    SizedBox(height: 25,),
                    CustomArrowButton(text: 'Night'),
                    SizedBox(height: 25,),
                    NightWallpapers(),
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
