import 'package:coffee_shop/utils/color_resources.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final double? width;
  final VoidCallback callback;
  const CommonButton(
      {super.key, required this.text, required this.callback, this.width});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        callback();
      },
      minWidth: width,
      height: 50,
      color: ColorResources.lightOrange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: ColorResources.whiteColor,
            fontSize: 15,
            letterSpacing: 1,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
