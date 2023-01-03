import 'package:coffee_shop/colors/color_resources.dart';
import 'package:coffee_shop/components/home_header.dart';
import 'package:coffee_shop/components/product_card.dart';
import 'package:coffee_shop/components/product_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<String> _tabs = [
    'Latto',
    'Capaccino',
    'Expresso',
  ];
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabs.length, vsync: this);
  }

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
                    preferredSize: const Size.fromHeight(120),
                    child: ProductTabBar(
                      controller: _controller,
                      tabs: _tabs,
                    )),
                pinned: false,
                //expandedHeight: 100.0,
                forceElevated: innerBoxIsScrolled,
              ),
            ),
          ];
        },
        body: Container(
         
          child: TabBarView(
            controller: _controller,
            children: _tabs
                .map(
                  (_) => SafeArea(
                    top: false,
                    bottom: false,
                    child: Builder(
                      builder: (BuildContext context) {
                        return CustomScrollView(
                          //    key: PageStorageKey<String>(name.key),
                          slivers: <Widget>[
                            SliverOverlapInjector(
                              // This is the flip side of the SliverOverlapAbsorber
                              // above.
                              handle:
                                  NestedScrollView.sliverOverlapAbsorberHandleFor(
                                      context),
                            ),
                            // SliverStaggeredGrid.countBuilder(context)
                            SliverPadding(
                                padding: const EdgeInsets.all(8.0),
                                sliver: SliverGrid(
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200.0,
                                    mainAxisSpacing: 10.0,
                                    crossAxisSpacing: 10.0,
                                    childAspectRatio: 1.6 / 2.5,
                                  ),
                                  delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                      return const ProductCard();
                                    },
                                    childCount: 5,
                                  ),
                                )),
                          ],
                        );
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ));
  }

  // return Scaffold(
  //   appBar: AppBar(
  //     leadingWidth: 65,
  //     toolbarHeight: 40,
  //     elevation: 0,
  //     leading: Padding(
  //       padding: const EdgeInsets.only(left: 25),
  //       child: DecoratedBox(
  //         decoration: BoxDecoration(
  //             gradient: const LinearGradient(
  //               colors: <Color>[
  //                 Color.fromRGBO(62, 63, 75, 1),
  //                 Color.fromRGBO(8, 8, 9, 1)
  //               ],
  //             ),
  //             borderRadius: BorderRadius.circular(15)),
  //         child: Padding(
  //           padding: const EdgeInsets.all(6.0),
  //           child: Image.network(
  //             'https://static.thenounproject.com/png/1143725-200.png',
  //             color: ColorResources.iconColorGrey,
  //           ),
  //         ),
  //       ),
  //     ),
  //     actions: [
  //       Padding(
  //         padding: const EdgeInsets.only(right: 25),
  //         child: SizedBox(
  //           width: 40,
  //           height: 40,
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(10),
  //             child: Image.network(
  //               'https://hips.hearstapps.com/hmg-prod/images/shutterstock-editorial-9226301c-1649873073.jpg',
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   ),
  //   body: Padding(
  //     padding: const EdgeInsets.all(25.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: [
  //         Text(
  //           'Find the best\nCoffee for you',
  //           style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 35,
  //               letterSpacing: 1,
  //               fontWeight: FontWeight.w500),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.symmetric( vertical: 30),
  //           child: TextField(
  //             cursorColor: Colors.black,
  //             decoration: InputDecoration(
  //               contentPadding: EdgeInsets.zero,
  //               prefixIcon: const Icon(
  //                 Icons.search,
  //                 color: ColorResources.iconColorGrey,
  //               ),
  //               border: InputBorder.none,
  //               hintText: 'Find your coffee...',
  //               hintStyle: const TextStyle(fontSize: 15, color: ColorResources.iconColorGrey,),
  //               filled: true,
  //               enabledBorder: OutlineInputBorder(
  //                 borderSide: const BorderSide(color: Color.fromRGBO(27, 26, 38, 0.87)),
  //                 borderRadius: BorderRadius.circular(
  //                   10.0,
  //                 ),
  //               ),
  //               fillColor: Color.fromARGB(255, 28, 32, 42)
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  // );
}
