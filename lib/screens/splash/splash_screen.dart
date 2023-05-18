import 'package:flutter/material.dart';
import 'package:one_more_wallpaper/screens/main_screen/main_screen.dart';
import 'package:one_more_wallpaper/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3,),(){
      nextPageOnly(context: context,page: const MainScreen());
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset("assets/image/app_logo.png",width: 300,),
            const Positioned(
                left: 23,
                top: 23,
                child: CircularProgressIndicator(color: Colors.deepOrange),
            )
          ],
        ),
      ),
    );
  }
}
