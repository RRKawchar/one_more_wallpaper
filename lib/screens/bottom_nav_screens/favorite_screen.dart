import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:one_more_wallpaper/screens/full_screen/full_screen.dart';
import 'package:one_more_wallpaper/utils/routes.dart';
import 'package:one_more_wallpaper/widgets/build_image.dart';
import 'package:one_more_wallpaper/widgets/cutstom_text.dart';

class FavoriteScreen extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(text: "Favorite Item",)
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
        child: auth.currentUser==null?const Center(child: Text("No found favorite item"),):StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('FavoriteImages')
              .doc(auth.currentUser!.uid)
              .collection('favourite')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // Extract the list of favorite image documents from the snapshot.
            List<DocumentSnapshot> favoriteImageDocs = snapshot.data!.docs;

            return GridView.builder(
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  mainAxisExtent: 220),
              itemCount: favoriteImageDocs.length,
              itemBuilder: (context, index) {
                String imageUrl = favoriteImageDocs[index]['imageUrl'];
                String id=favoriteImageDocs[index]['imageId'];

                // Display the image using a NetworkImage widget.
                return InkWell(
                    onTap: (){
                      nextPage(context: context,page: FullScreen(imageUrl: imageUrl, imageId: id));
                    },
                    child: BuildImage(size: MediaQuery.of(context).size, imgUrl: imageUrl));
              },
            );
          },
        ),
      ),
    );


  }
}