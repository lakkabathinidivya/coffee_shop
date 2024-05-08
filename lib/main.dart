import 'package:coffee_shop/screens/onBoarding.dart';
import 'package:coffee_shop/utils/bag_provider.dart';
import 'package:coffee_shop/utils/color_resources.dart';
import 'package:coffee_shop/utils/%20fav_provider.dart';
import 'package:coffee_shop/utils/cup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductModel>(create: (_) => ProductModel()),
        ChangeNotifierProvider<BagProvider>(create: (_) => BagProvider()),
        ChangeNotifierProvider<CupSizeProvider>(create: (_) => CupSizeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          canvasColor: ColorResources.bottomNavColor,
          appBarTheme: const AppBarTheme(
            color: ColorResources.primaryColor, //<-- SEE HERE
          ),
          scaffoldBackgroundColor: ColorResources.primaryColor,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: ColorResources.primaryColor),
          primarySwatch: Colors.blue,
        ),
        home: const OnBoardingPage(),
      ),
    );
  }
}
