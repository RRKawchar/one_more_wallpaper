import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
   CustomCarouselSlider({super.key});

  List<Map> items = [
    {
      'name':"Kawchar",
      'image':'https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819__340.jpg'
    },
    {
      'name':"Riyaz",
      "image":'https://images.pexels.com/photos/9266562/pexels-photo-9266562.jpeg?cs=srgb&dl=pexels-rahul-soni-9266562.jpg&fm=jpg'
    }


  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,


      ),
      items: List.generate(items.length, (index){
        final data=items[index];
      return  ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.network(
          data['image'],
          fit: BoxFit.cover,
        ),
      );
      })
    );
  }
}
