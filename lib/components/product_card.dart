import 'package:coffee_shop/screens/product_detailed_screen.dart';
import 'package:flutter/material.dart';

import '../colors/color_resources.dart';

class ProductCard extends StatelessWidget {
  // final bool isFavorite;
  // final ProductItem item;
  // final Function()? onUpdate;
  const ProductCard({
    super.key,
    // required this.onUpdate,
    // required this.isFavorite,
    // required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: <Color>[
            Color.fromRGBO(62, 63, 75, 1),
            Color.fromRGBO(8, 8, 9, 1)
          ],
        ),
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProductDetailedScreen();
                  }));
                },
                child: Stack(
                  children: [
                    Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.network(
                        'https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg',
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                        right: 10,
                        top: 10,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          // heightFactor: 0.5,
                          // widthFactor: 0.5,
                          child: Container(
                            decoration: BoxDecoration(
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
                                    Icon(
                                      Icons.star,
                                      color: ColorResources.lightOrange,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '4.3',
                                      style: TextStyle(
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
            const Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Latto',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
            ),
            const Flexible(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Text(
                  '${68.78}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Text(
                        '\$ 78.89',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: ColorResources.lightOrange),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: ColorResources.lightOrange,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.add,
                          // : Icons.favorite_outline_outlined,
                          size: 15,
                          color: ColorResources.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
    );
  }
}
