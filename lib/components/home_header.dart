import 'package:coffee_shop/utils/app_images.dart';
import 'package:coffee_shop/utils/color_resources.dart';

import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: <Color>[
                              Color.fromRGBO(62, 63, 75, 1),
                              Color.fromRGBO(8, 8, 9, 1)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        AppImages.fourDot,
                        color: ColorResources.iconColorGrey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  width: 45,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                            colors: <Color>[
                              Color.fromRGBO(131, 131, 130, 0.371),
                              Color.fromRGBO(48, 48, 53, 0.143),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          AppImages.profilePic,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              'Find the best\ncoffee for you',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Image.asset(
                    AppImages.searchBar,
                    color: ColorResources.iconColorGrey,
                    height: 4,
                  ),
                  border: InputBorder.none,
                  hintText: 'Find your coffee...',
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    letterSpacing: 0.5,
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
                  fillColor: const Color.fromARGB(255, 28, 32, 42)),
            ),
          ),
        ],
      ),
    );
  }
}
