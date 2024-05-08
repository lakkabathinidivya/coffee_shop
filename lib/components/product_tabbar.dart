import 'package:coffee_shop/utils/color_resources.dart';
import 'package:flutter/material.dart';

class ProductTabBar extends StatelessWidget {
  const ProductTabBar(
      {required this.controller,
      super.key,
      required this.tabs,
      required this.activeIndex});
  final List<String> tabs;
  final TabController controller;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      tabAlignment: TabAlignment.center,
      labelColor: ColorResources.lightOrange,
      unselectedLabelColor: Colors.grey,
      dividerColor: Colors.transparent,
      indicatorColor: const Color.fromARGB(0, 158, 94, 59),
      tabs: tabs
          .map(
            (e) => Column(
              children: [
                Tab(
                  text: e,
                ),
                CircleAvatar(
                  backgroundColor: activeIndex == tabs.indexOf(e)
                      ? ColorResources.lightOrange
                      : Colors.transparent,
                  radius: 4,
                )
              ],
            ),
          )
          .toList(),
    );

  }
}
