import 'package:coffee_shop/colors/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductTabBar extends StatelessWidget {
  const ProductTabBar({
    required this.controller,
    super.key,
    required this.tabs,
  });
  final List<String> tabs;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
labelColor: ColorResources.lightOrange,
      // labelColor: const Color(0xff9e5e3b),
      unselectedLabelColor: Colors.grey,
      indicator: BoxDecoration(
        shape: BoxShape.circle,
      ),
      indicatorWeight: 30,
      indicatorSize: TabBarIndicatorSize.tab,
   //   indicatorColor: const Color(0xff9e5e3b),
      tabs: tabs
          .map(
            (e) => Tab(
              
              text: e,
            ),
          )
          .toList(),
    );

    // body: TabBarView(
    //   children: [
    //     Icon(Icons.flight, size: 350),
    //     Icon(Icons.directions_transit, size: 350),
    //     Icon(Icons.directions_car, size: 350),
    //   ],
    // ),
  }
}
