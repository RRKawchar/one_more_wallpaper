import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:one_more_wallpaper/screens/full_screen/full_screen.dart';
import 'package:one_more_wallpaper/utils/routes.dart';
import 'package:one_more_wallpaper/widgets/build_image.dart';
import 'package:one_more_wallpaper/widgets/cutstom_text.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('carousel_slider')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<DocumentSnapshot> data = snapshot.data!.docs;

          return CarouselSlider(
              options: CarouselOptions(
                height: 200,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: data.map((doc) {
                final name = doc['name'];
                final imageUrl = doc['image'];
                final imageId = doc['image_id'];
                return Builder(builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: BuildImage(
                              size: MediaQuery.of(context).size,imgUrl: imageUrl
                              ,
                            )
                          ),
                          Positioned.fill(
                            bottom: -1,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                    offset: const Offset(0, 4), // Adjust the offset for the desired shadow position
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 20,
                            left: 5,
                            child: SizedBox(
                              height: 50,
                              width: 200,
                              child: CustomText(
                                text: name,
                                fontWeight: FontWeight.bold,
                                textColor: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 30,
                            right: 10,
                            child: InkWell(
                              onTap: (){
                                nextPage(context: context,page: FullScreen(imageUrl: imageUrl, imageId:imageId ,));
                              },
                              child: Container(
                                height: 30,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 1.0,
                                          color: Colors.white,
                                          spreadRadius: 1.0)
                                    ],
                                    border: Border.all(
                                        color: Colors.white, width: 2.0)),
                                child: Center(
                                  child: CustomText(text:
                                    "View",fontWeight: FontWeight.bold,textColor: Colors.brown,),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
              }).toList()

              );
        });
  }
}
