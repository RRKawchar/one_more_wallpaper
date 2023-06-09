import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:one_more_wallpaper/screens/full_screen/full_screen.dart';
import 'package:one_more_wallpaper/utils/routes.dart';
import 'package:one_more_wallpaper/widgets/build_image.dart';
import 'package:one_more_wallpaper/widgets/cutstom_text.dart';

class AbstractWallpaper extends StatelessWidget {
  const AbstractWallpaper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Abstract_category')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  Center(
              child: Container(),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: CustomText(
                text: "No Images Founded",
              ),
            );
          }

          List<DocumentSnapshot> data = snapshot.data!.docs;
          return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  mainAxisExtent: 220),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final image = data[index]['image_url'];
                final imageId = data[index]['image_id'];
                return InkWell(
                  onTap: () {
                    nextPage(
                        context: context,
                        page: FullScreen(
                          imageUrl: image,
                          imageId: imageId,
                        ));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(20)),
                      child: BuildImage(
                        size: MediaQuery.of(context).size,
                        imgUrl: image,
                      )),
                );
              });
        });
  }
}
