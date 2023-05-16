import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FullScreen extends StatefulWidget {
  final String imageUrl;
  const FullScreen({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
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
                  children: const [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.share_rounded,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                )),
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
                      onPressed: () {},
                      child: const Text("Apply"),
                    ),
                  ),
                ))
          ],
        ),
      ),
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
