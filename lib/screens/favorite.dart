import 'package:coffee_shop/components/product_card.dart';

import 'package:coffee_shop/utils/color_resources.dart';
import 'package:coffee_shop/utils/%20fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  const Favorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
              color: Colors.white, size: 15 //change your color here
              ),
          automaticallyImplyLeading: true,
          title: const Text(
            'Favorites',
            style: TextStyle(
                color: ColorResources.whiteColor,
                letterSpacing: 1,
                fontSize: 15),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<ProductModel>(builder: (context, itemModel, child) {
            return itemModel.items.isNotEmpty
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0,
                      mainAxisSpacing: 30.0,
                      crossAxisSpacing: 20.0,
                      childAspectRatio: 1.6 / 2.5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(
                        isDelete: true,
                        model: itemModel.items[index],
                        callback: () {
                          Provider.of<ProductModel>(context, listen: false)
                              .removeItem(index);
                        },
                      );
                    },
                    itemCount: itemModel.items.length,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/images/coffee.json'),
                      const Text(
                        'Let\'s brew some joy together!!!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorResources.whiteColor,
                            letterSpacing: 2,
                            wordSpacing: 1,
                            fontSize: 18),
                      )
                    ],
                  );
          }),
        ));
  }
}
