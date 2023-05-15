import 'package:flutter/material.dart';
import 'package:one_more_wallpaper/widgets/cutstom_text.dart';

class FullScreen extends StatefulWidget {
  final String imageUrl;
  const FullScreen({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
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
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
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
                    SizedBox(height: 20,),
                    Icon(Icons.favorite,color: Colors.white,size: 30,),
                    SizedBox(height: 20,),
                    Icon(Icons.share_rounded,size: 30,color: Colors.white,)
                  ],
                )

            ),
            Positioned(

                bottom: 20,
                  left: 20,
                right: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text("Apply"),
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
