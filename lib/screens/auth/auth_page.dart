import 'package:flutter/material.dart';
import 'package:one_more_wallpaper/provider/auth_provider.dart';
import 'package:one_more_wallpaper/screens/full_screen/full_screen.dart';
import 'package:one_more_wallpaper/utils/routes.dart';
import 'package:one_more_wallpaper/utils/show_alert.dart';

class AuthPage extends StatefulWidget {
  final String imageUrl;
  final String imageId;
  const AuthPage({Key? key, required this.imageUrl, required this.imageId}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: CustomButton(
              text: 'Continue with google',
             image: "assets/image/google.png",
              onTap: (){
                AuthProvider().signInWithGoogle().then((value){
                  nextPageOnly(context: context,page: FullScreen(imageUrl: widget.imageUrl, imageId: widget.imageId,));
                }).catchError((e){
                  showAlert(context, e.toString());
                });
              },
              bgColor: Colors.blue,
              textColor: Colors.white
          ),
        ),
      ),
    );
  }

  Widget CustomButton({
    required String text,
    String? image,
    Function? onTap,
    Color? bgColor,
    Color? textColor,
  }){
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue,width: 1.5)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image!,width: 30,),
            const SizedBox(width: 20,),
            Text(text,style: TextStyle(
                color: textColor
            ),)
          ],
        ),
      ),
    );
  }
}