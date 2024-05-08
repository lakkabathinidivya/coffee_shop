// ignore_for_file: file_names

import 'package:coffee_shop/components/common_button.dart';
import 'package:coffee_shop/dashboard_screen.dart';
import 'package:coffee_shop/utils/app_images.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.onBaord),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(148, 0, 0, 0),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 8, 8, 8),
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 30.0,
                      spreadRadius: 20.0,
                    ),
                  ]),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Find the Best Coffee \nfor you!!!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 10.0,
                ),
              ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Skip now',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w300),
                    ),
                    CommonButton(
                        text: 'Next',
                        callback: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Dashbaord();
                          }));
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
