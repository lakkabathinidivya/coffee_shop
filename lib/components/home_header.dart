import 'package:coffee_shop/colors/color_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color.fromRGBO(62, 63, 75, 1),
                          Color.fromRGBO(8, 8, 9, 1)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.network(
                      'https://static.thenounproject.com/png/1143725-200.png',
                      color: ColorResources.iconColorGrey,
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://hips.hearstapps.com/hmg-prod/images/shutterstock-editorial-9226301c-1649873073.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              'Find the best\nCoffee for you',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: ColorResources.iconColorGrey,
                  ),
                  border: InputBorder.none,
                  hintText: 'Find your coffee...',
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    color: ColorResources.iconColorGrey,
                  ),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(27, 26, 38, 0.87)),
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  fillColor: Color.fromARGB(255, 28, 32, 42)),
            ),
          ),
        ],
      ),
    );
  }
}
