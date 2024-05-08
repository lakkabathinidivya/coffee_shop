import 'package:coffee_shop/components/product_model.dart';
import 'package:coffee_shop/screens/product_detailed_screen.dart';
import 'package:flutter/material.dart';

import '../utils/color_resources.dart';

class ProductCard extends StatelessWidget {
  final Product model;
  final bool? isDelete;
  final VoidCallback callback;

  const ProductCard({
    super.key,
    this.isDelete = false,
    required this.callback,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(colors: <Color>[
          Color.fromRGBO(62, 63, 75, 0.363),
          Color.fromRGBO(8, 8, 9, 1)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProductDetailedScreen(
                      model: model,
                    );
                  }));
                },
                child: Stack(
                  children: [
                    Card(
                      color: const Color.fromRGBO(62, 63, 75, 0.363),
                      margin: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 11),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                        model.image,
                        height: 149,
                        width: 150,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                        right: 10,
                        top: 10,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(15.0),
                              ),
                              color: Color.fromARGB(146, 33, 22, 3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: ColorResources.lightOrange,
                                      size: 15,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      model.rating.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ]),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                model.title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Text(
                model.description,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      '\$ ${model.price}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: ColorResources.lightOrange),
                    ),
                  ),
                  GestureDetector(
                    onTap: callback,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: ColorResources.lightOrange,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            isDelete == true ? Icons.delete : Icons.favorite,
                            size: 15,
                            color: ColorResources.whiteColor,
                          )),
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
