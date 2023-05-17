import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:one_more_wallpaper/screens/auth/auth_page.dart';
import 'package:one_more_wallpaper/utils/routes.dart';
import 'package:one_more_wallpaper/widgets/cutstom_text.dart';

class FullScreen extends StatefulWidget {
  final String imageUrl;
  final String imageId;
  const FullScreen({Key? key, required this.imageUrl, required this.imageId})
      : super(key: key);

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future addToFavourite(String imageUrl, String imageId) async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("FavoriteImages");
    return _collectionRef
        .doc(auth.currentUser!.uid)
        .collection("favourite")
        .doc()
        .set({
      'imageUrl': imageUrl,
      'imageId': imageId,
    }).then((value) => print("Added to favourite"));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Stack(
          children: [
            InteractiveViewer(
              minScale: 0.1,
              maxScale: 5.0,
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: cachedImage(
                    size: MediaQuery.of(context).size,
                    imgUrl: widget.imageUrl,
                  )),
            ),
            Positioned(
              right: 10,
              bottom: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Profile
                  _customProfile(context),

                  const SizedBox(height: 30),
                  auth.currentUser == null
                      ? IconButton(
                          onPressed: () {
                            nextPage(context:context,page: AuthPage(imageUrl: widget.imageUrl, imageId: widget.imageId) );
                          },
                          icon: const Icon(
                            Icons.favorite,
                            size: 35,
                            color: Colors.white,
                          ))
                      : StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('FavoriteImages')
                              .doc(auth.currentUser!.uid)
                              .collection('favourite')
                              .where('imageId', isEqualTo: widget.imageId)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data != null) {
                              final data = snapshot.data!;
                              return IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: data.docs.isEmpty
                                      ? Colors.white
                                      : Colors.red,
                                  size: 35,
                                ),
                                onPressed: () {
                                  if (auth.currentUser != null) {
                                    final wallpaperRef = FirebaseFirestore
                                        .instance
                                        .collection('FavoriteImages')
                                        .doc(auth.currentUser!.uid)
                                        .collection('favourite');

                                    wallpaperRef.get().then((snapshot) {
                                      if (snapshot.size >= 8) {
                                        final oldestWallpaper =
                                            snapshot.docs[0];
                                        oldestWallpaper.reference.delete();
                                      }
                                      addToFavourite(
                                          widget.imageUrl, widget.imageId);
                                    });
                                  } else {
                                    nextPage(
                                      context: context,
                                      page: AuthPage(
                                        imageUrl: widget.imageUrl,
                                        imageId: widget.imageId,
                                      ),
                                    );
                                  }
                                },
                              );
                            } else {
                              // Show an alternative widget or return null
                              return const SizedBox();
                            }
                          },
                        ),

                  // StreamBuilder<QuerySnapshot>(
                  //   stream: FirebaseFirestore.instance
                  //       .collection('FavoriteImages')
                  //       .doc(auth.currentUser!.uid)
                  //       .collection('favourite')
                  //       .where('imageId', isEqualTo: widget.imageId)
                  //       .snapshots(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData && snapshot.data != null) {
                  //       final data = snapshot.data!;
                  //       return IconButton(
                  //         icon: Icon(
                  //           Icons.favorite,
                  //           color: data.docs.isEmpty ? Colors.white : Colors.red,
                  //           size: 35,
                  //         ),
                  //         onPressed: () {
                  //           if (auth.currentUser == null) {
                  //             nextPage(
                  //               context: context,
                  //               page: AuthPage(
                  //                 imageUrl: widget.imageUrl,
                  //                 imageId: widget.imageId,
                  //               ),
                  //             );
                  //           } else {
                  //             final wallpaperRef = FirebaseFirestore.instance
                  //                 .collection('FavoriteImages')
                  //                 .doc(auth.currentUser!.uid)
                  //                 .collection('favourite');
                  //
                  //             wallpaperRef.get().then((snapshot) {
                  //               if (snapshot.size >= 8) {
                  //                 final oldestWallpaper = snapshot.docs[0];
                  //                 oldestWallpaper.reference.delete();
                  //               }
                  //               addToFavourite(widget.imageUrl, widget.imageId);
                  //             });
                  //           }
                  //         },
                  //       );
                  //     } else {
                  //       return CircularProgressIndicator(); // Show a loading indicator or an alternative widget
                  //     }
                  //   },
                  // ),

                  const SizedBox(height: 30),
                  const Icon(
                    Icons.share_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          _showWallpaperOptions(widget.imageUrl);
                        },
                        child: CustomText(
                          text: "Apply",
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white,
                          size: 20,
                        )),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Stack _customProfile(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            nextPage(
                context: context,
                page: AuthPage(
                  imageUrl: widget.imageUrl,
                  imageId: widget.imageId,
                ));
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.orangeAccent,
            child: auth.currentUser != null
                ? CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.indigo,
                    backgroundImage:
                        NetworkImage(auth.currentUser!.photoURL.toString()),
                  )
                : const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.indigo,
                    backgroundImage: AssetImage('assets/image/google.png'),
                  ),
          ),
        ),
        const Positioned(
          bottom: 0,
          left: 13,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.red,
            child: Icon(
              Icons.add,
              size: 15,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  void _showWallpaperOptions(String imageUrl) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Set as home screen'),
                onTap: () async {
                  int location = WallpaperManager.HOME_SCREEN;
                  var file =
                      await DefaultCacheManager().getSingleFile(imageUrl);
                  bool result = await WallpaperManager.setWallpaperFromFile(
                      file.path, location);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Set as lock screen'),
                onTap: () async {
                  int location = WallpaperManager.LOCK_SCREEN;
                  var file =
                      await DefaultCacheManager().getSingleFile(imageUrl);
                  bool result = await WallpaperManager.setWallpaperFromFile(
                      file.path, location);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.smartphone),
                title: const Text('Set as both'),
                onTap: () async {
                  int location = WallpaperManager.BOTH_SCREEN;
                  var file =
                      await DefaultCacheManager().getSingleFile(imageUrl);
                  bool result = await WallpaperManager.setWallpaperFromFile(
                      file.path, location);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget cachedImage({required Size size, required String imgUrl}) {
    return Container(
      height: size.height,
      width: size.height,
      child: Center(
          child: imgUrl == null || imgUrl.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image_not_supported,
                      size: size.height * 0.1,
                    ),
                  ],
                )
              : CachedNetworkImage(
                  imageUrl: "$imgUrl",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(0.0, 2.0),
                            blurRadius: 5)
                      ],
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                            Colors.black12, BlendMode.colorBurn),
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )),
    );
  }
}
