import 'package:coffee_shop/screens/bag.dart';
import 'package:coffee_shop/utils/app_images.dart';
import 'package:coffee_shop/utils/color_resources.dart';

import 'package:coffee_shop/screens/favorite.dart';
import 'package:coffee_shop/screens/homePage.dart';
import 'package:coffee_shop/screens/profile.dart';

import 'package:flutter/material.dart';

class Dashbaord extends StatefulWidget {
  const Dashbaord({super.key});

  @override
  State<Dashbaord> createState() => _DashbaordState();
}

class _DashbaordState extends State<Dashbaord> {
  int pageIndex = 0;

  final pages = [
    const HomePage(),
    const Favorite(),
    BagScreen(
      cartList: const [],
    ),
    const Profile(),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: BottomNavigationBar(
          showSelectedLabels: true,
          selectedLabelStyle: const TextStyle(letterSpacing: 1.5),
          selectedFontSize: 12,
          unselectedItemColor: Colors.grey,
          selectedItemColor: ColorResources.lightOrange,
          backgroundColor: ColorResources.primaryColor,
          currentIndex: pageIndex, //New
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset(
                  AppImages.bottomHome,
                  height: 20,
                  color: ColorResources.iconColorGrey,
                ),
                activeIcon: Image.asset(
                  AppImages.bottomHome,
                  height: 20,
                  color: ColorResources.lightOrange,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  AppImages.bottomFav,
                  height: 20,
                  color: ColorResources.iconColorGrey,
                ),
                activeIcon: Image.asset(
                  AppImages.bottomFav,
                  height: 20,
                  color: ColorResources.lightOrange,
                ),
                label: 'Favourite'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: 'Shop'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  AppImages.bottomNotify,
                  color: ColorResources.iconColorGrey,
                  height: 20,
                ),
                activeIcon: Image.asset(
                  AppImages.bottomNotify,
                  color: ColorResources.lightOrange,
                  height: 20,
                ),
                label: 'Notify'),
          ],
        ),
      ),
    );
  }
}
