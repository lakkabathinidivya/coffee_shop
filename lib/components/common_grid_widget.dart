import 'package:coffee_shop/components/product_card.dart';
import 'package:coffee_shop/components/product_model.dart';
import 'package:coffee_shop/utils/%20fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommonGridWidget extends StatelessWidget {
  final List<Product> products;
  const CommonGridWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0,
                      mainAxisSpacing: 30.0,
                      crossAxisSpacing: 20.0,
                      childAspectRatio: 1.6 / 2.5,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return ProductCard(
                          model: products[index],
                          callback: () {
                            Provider.of<ProductModel>(context, listen: false)
                                .addItem(products[index]);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor:
                                    const Color.fromARGB(131, 22, 17, 12),
                                duration: const Duration(milliseconds: 500),
                                content: Text(
                                    '${products[index].title} Added to favorites'),
                              ),
                            );
                          },
                        );
                      },
                      childCount: products.length,
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}
