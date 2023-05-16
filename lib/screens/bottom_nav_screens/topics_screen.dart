import 'package:flutter/material.dart';
import 'package:one_more_wallpaper/model/data_model.dart';
import 'package:one_more_wallpaper/screens/categories/view_category.dart';
import 'package:one_more_wallpaper/utils/routes.dart';
import 'package:one_more_wallpaper/widgets/cutstom_text.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustomText(text: 'Topics',textColor: Colors.black,fontWeight: FontWeight.bold,)
      ),
         body: SafeArea(
           child: ListView.builder(
               itemCount: topicsList.length,
               itemBuilder: (context,index){

                 final category=topicsList[index]['category'];
                 final catName=topicsList[index]['catName'];
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Stack(
                     children: [
                       InkWell(
                         onTap: (){
                           nextPage(context: context,page: ViewCategory(category:category,catName: catName,));
                         },
                         child: Container(
                           height: 200,
                           width: MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
                               color: Colors.blueGrey,
                             borderRadius: BorderRadius.circular(20),
                             image: DecorationImage(
                               image: NetworkImage(topicsList[index]['image_url']),
                               fit: BoxFit.cover
                             )
                           ),
                         ),
                       ),
                       Positioned(
                         top: 50,
                           left: 20,
                           child: CustomText(text: topicsList[index]['catName'],size: 30,fontWeight: FontWeight.bold,textColor: Colors.white70,)
                       )
                     ],
                   ),
                 );
               }
           ),
         ),
    );
  }
}
