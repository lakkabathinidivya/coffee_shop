import 'package:coffee_shop/colors/color_resources.dart';
import 'package:coffee_shop/screens/cart.dart';
import 'package:coffee_shop/screens/favorite.dart';
import 'package:coffee_shop/screens/homePage.dart';
import 'package:coffee_shop/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Dashbaord extends StatefulWidget {
  const Dashbaord({super.key});

  @override
  State<Dashbaord> createState() => _DashbaordState();
}



class _DashbaordState extends State<Dashbaord> {





int pageIndex = 0;
  
  final pages = [
    HomePage(),
    CartScreen(),
    Favorite(),
  Profile(),
  ];


void _onItemTapped(int index) {
  setState(() {
    pageIndex = index;
  });
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: pages[pageIndex],
     
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.orange,
         unselectedIconTheme: IconThemeData(
    color: Color.fromRGBO(131, 127, 127, 1),
  ),
  unselectedItemColor: Colors.deepOrangeAccent,
       backgroundColor: ColorResources.primaryColor,
        currentIndex: pageIndex, //New
  onTap: _onItemTapped,        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
         label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
