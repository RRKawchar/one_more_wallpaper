import 'package:flutter/material.dart';
import 'package:one_more_wallpaper/screens/bottom_nav_screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
   int _selectedIndex=0;
final List<Widget> _pages=[
  HomeScreen(),
  const Text("Topics"),
  const Text("Favorite")
];

   void _onItemTapped(value){
     setState(() {
       _selectedIndex=value;
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xfff141c1c),
        elevation: 0.0,
        items:  <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: '',
          ),
          BottomNavigationBarItem(
             icon: Icon(_selectedIndex==2?Icons.favorite:Icons.favorite_border),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
