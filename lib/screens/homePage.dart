// ignore_for_file: file_names

import 'package:coffee_shop/components/common_grid_widget.dart';
import 'package:coffee_shop/components/product_model.dart';
import 'package:coffee_shop/utils/app_images.dart';
import 'package:coffee_shop/utils/color_resources.dart';
import 'package:coffee_shop/components/home_header.dart';
import 'package:coffee_shop/components/product_tabbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _activeIndex = 0;
  final List<String> _tabs = ['Capaccino', 'Latto', 'Expresso', 'Americano'];
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabs.length, vsync: this);
    _controller.addListener(() {
      setState(() {
        _activeIndex = _controller.index;
      });
    });
  }

  final List<Product> capaccino = [
    Product(
        image: AppImages.coffee,
        title: 'Cappacinoo',
        rating: 4.3,
        id: 1,
        cupSize: 'Small',
        description: 'Milk with Oats',
        price: 75.65),
    Product(
        image: AppImages.coffee1,
        title: 'Cortado',
        rating: 5.0,
        id: 2,
        cupSize: 'Small',
        description: 'Fresh Relax ',
        price: 115.65),
    Product(
        image: AppImages.coffee2,
        title: 'Hazelnut Americano',
        rating: 4.8,
        id: 3,
        cupSize: 'Small',
        description: 'Milk with Oats',
        price: 55.40),
    Product(
        image: AppImages.coffee3,
        title: 'Iced Caremel',
        rating: 4.5,
        id: 4,
        cupSize: 'Small',
        description: 'Milk with Oats',
        price: 38.68),
    Product(
        image: AppImages.coffee4,
        title: 'Java Chip',
        rating: 4.6,
        id: 5,
        cupSize: 'Small',
        description: 'Milk with Oats',
        price: 86.15),
  ];

  final List<Product> latto = [
    Product(
        image: AppImages.coffee6,
        title: 'Coconut Latte',
        rating: 4.3,
        id: 1,
        cupSize: 'Small',
        description: 'Milk with Oats',
        price: 75.65),
    Product(
        image: AppImages.coffee7,
        title: 'Mocha Latte',
        rating: 5.0,
        id: 2,
        cupSize: 'Small',
        description: 'Fresh Relax ',
        price: 115.65),
    Product(
        image: AppImages.coffee8,
        title: 'Toffee Nut Latte',
        rating: 4.8,
        id: 3,
        cupSize: 'Small',
        description: 'Milk with Oats',
        price: 55.40),
    Product(
        image: AppImages.coffee9,
        title: 'Irish Cream Latte',
        rating: 4.5,
        id: 4,
        cupSize: 'Small',
        description: 'Milk with Oats',
        price: 38.68),
    Product(
        image: AppImages.coffee10,
        title: 'Caremel Chip',
        rating: 4.6,
        id: 5,
        cupSize: 'Small',
        description: 'Milk with Oats',
        price: 86.15),
  ];

  final List<Product> expresso = [
    Product(
        image: AppImages.coffee12,
        title: 'Cinnamon',
        rating: 4.3,
        id: 1,
        cupSize: 'Small',
        description: 'Milk with Oats',
        price: 75.65),
    Product(
        image: AppImages.coffee13,
        title: 'HazelNut',
        rating: 5.0,
        id: 2,
        cupSize: 'Small',
        description: 'Fresh Relax ',
        price: 115.65),
    Product(
        image: AppImages.coffee14,
        title: 'Hazelnut Choclate',
        rating: 4.8,
        id: 3,
        cupSize: 'Small',
        description: 'Milk with Oats',
        price: 55.40),
    Product(
        image: AppImages.coffee15,
        title: 'Mint Caremel',
        rating: 4.5,
        id: 4,
        cupSize: 'Small',
        description: 'Milk with Oats',
        price: 38.68),
  ];

  final List<Product> americano = [
    Product(
        image: AppImages.coffee16,
        title: 'Orange Oreo Drink',
        rating: 4.3,
        id: 1,
        cupSize: 'Small',
        description: 'Milk with Oats',
        price: 75.65),
    Product(
        image: AppImages.coffee17,
        title: 'Mojito Deep Cream',
        rating: 5.0,
        id: 2,
        cupSize: 'Small',
        description: 'Fresh Relax ',
        price: 115.65),
    Product(
        image: AppImages.coffee18,
        title: 'Hazelnut',
        rating: 4.8,
        id: 3,
        cupSize: 'Small',
        description: 'Milk with Oats',
        price: 55.40),
    Product(
        image: AppImages.coffee19,
        title: 'Iced Caremel',
        rating: 4.5,
        id: 4,
        cupSize: 'Small',
        description: 'Milk with Oats',
        price: 38.68),
    Product(
        image: AppImages.coffee20,
        title: 'Custard Blue',
        rating: 4.6,
        id: 5,
        cupSize: 'Small',
        description: 'Milk with Oats',
        price: 86.15),
  ];

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                backgroundColor: ColorResources.primaryColor,
                toolbarHeight:
                    kToolbarHeight + MediaQuery.of(context).size.height * 0.25,
                flexibleSpace: const HomeHeader(),
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(90),
                    child: ProductTabBar(
                      activeIndex: _activeIndex,
                      controller: _controller,
                      tabs: _tabs,
                    )),
                pinned: false,
                forceElevated: innerBoxIsScrolled,
              ),
            ),
          ];
        },
        body: TabBarView(controller: _controller, children: [
          CommonGridWidget(products: capaccino),
          CommonGridWidget(products: latto),
          CommonGridWidget(products: expresso),
          CommonGridWidget(products: americano),
        ]));
  }
}
