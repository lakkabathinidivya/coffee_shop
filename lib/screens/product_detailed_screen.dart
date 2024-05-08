import 'dart:ui';
import 'package:coffee_shop/components/common_button.dart';
import 'package:coffee_shop/utils/app_images.dart';
import 'package:coffee_shop/utils/bag_provider.dart';
import 'package:coffee_shop/utils/color_resources.dart';
import 'package:coffee_shop/utils/%20fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/product_model.dart';

class ProductDetailedScreen extends StatefulWidget {
  final Product model;
  const ProductDetailedScreen({super.key, required this.model});
  @override
  State<ProductDetailedScreen> createState() => _ProductDetailedScreenState();
}

class _ProductDetailedScreenState extends State<ProductDetailedScreen> {
  int selectedImageIndex = 1;

  void selectImage(int index) {
    setState(() {
      selectedImageIndex = index;
      onChangeProductCupSize(1);
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onChangeProductCupSize(1);
    });

    super.initState();
  }

  void onChangeProductCupSize(int quantity) {
    try {
      final Product? product = Provider.of<BagProvider>(context, listen: false)
          .getBagProducts(getCupSize(selectedImageIndex), widget.model.id);

      if (product != null) {
        product.quantity += quantity;
        product.total = product.quantity * product.price;
        _selectedProduct = product;
      } else {
        _selectedProduct = Product(
            image: widget.model.image,
            title: widget.model.title,
            rating: widget.model.rating,
            id: widget.model.id,
            cupSize: getCupSize(selectedImageIndex),
            description: widget.model.description,
            price: widget.model.price,
            quantity: 1);
      }
      setState(() {});
    // ignore: empty_catches
    } catch (e) {
      
    }
  }

  Product? _selectedProduct;

  void _increment() {
    onChangeProductCupSize(1);
  }

  void _decrement() {
    onChangeProductCupSize(-1);
  }

  String getCupSize(int id) {
    switch (id) {
      case 3:
        return 'Large';

      case 2:
        return 'Medium';
      case 1:
      default:
        return 'Small';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bagProvider = Provider.of<BagProvider>(context);

    return Scaffold(
      bottomNavigationBar: Container(
          margin: const EdgeInsets.all(20),
          //  color: ColorResources.lightOrange,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    'Price',
                    style:
                        TextStyle(color: Color.fromRGBO(255, 255, 255, 0.659)),
                  ),
                  Text(
                    '\$ ${((_selectedProduct?.price ?? 0) * (_selectedProduct?.quantity ?? 0)).toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 20, color: ColorResources.whiteColor),
                  )
                ],
              ),
              if (!bagProvider.isAlreadyInBag(
                  getCupSize(selectedImageIndex), widget.model.id))
                CommonButton(
                    text: 'Buy Now',
                    callback: () {
                      _selectedProduct?.quantity = 1;
                      _selectedProduct?.total =
                          _selectedProduct!.quantity * _selectedProduct!.price;
                      Provider.of<BagProvider>(context, listen: false)
                          .addItem(_selectedProduct!);
                    })
            ],
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 350,
                    child: Image.asset(
                      widget.model.image,
                      height: 450,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(height: 100, color: ColorResources.primaryColor)
                ],
              ),
              Positioned(
                  top: 50,
                  left: 20,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    width: MediaQuery.of(context).size.width * 0.9,
                    //color: ColorResources.primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: <Color>[
                                    Color.fromRGBO(62, 63, 75, 1),
                                    Color.fromRGBO(0, 0, 0, 1)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 8, top: 8, bottom: 8),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: ColorResources.iconColorGrey,
                            ),
                          ),
                        ),
                        DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: <Color>[
                                      Color.fromRGBO(62, 63, 75, 1),
                                      Color.fromRGBO(0, 0, 0, 1)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(12)),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  Provider.of<ProductModel>(context,
                                          listen: false)
                                      .addItem(widget.model);

                                  //  _favoriteManager.toggleFavorite(widget.model);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(AppImages.bottomFav,
                                    height: 15,
                                    color: Provider.of<ProductModel>(context,
                                                listen: false)
                                            .items
                                            .contains(widget.model)
                                        ? ColorResources.lightOrange
                                        : ColorResources.iconColorGrey),
                              ),
                            )),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 1,
                  child: SizedBox(
                    height: 140,
                    width: MediaQuery.of(context).size.width * 1,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.model.title,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1),
                                        ),
                                        Text(
                                          widget.model.description,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              letterSpacing: 1.5,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: ColorResources.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(
                                          AppImages.coffeeBean,
                                          height: 20,

                                          color: ColorResources.lightOrange,

                                          // color: ColorResources.lightOrange,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: ColorResources.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(
                                          AppImages.drop,
                                          height: 20,

                                          color: ColorResources.lightOrange,

                                          // color: ColorResources.lightOrange,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppImages.star,
                                      height: 20,
                                      color: ColorResources.lightOrange,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      '4.5',
                                      style: TextStyle(
                                          color: ColorResources.whiteColor,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18),
                                    ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: ColorResources.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        child: Text(
                                          'Medium Roasted',
                                          style: TextStyle(
                                              color: ColorResources.whiteColor,
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Description',
              style: TextStyle(color: Color.fromRGBO(208, 202, 202, 0.899)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'A cappuccino is an espresso-based coffee drink that originated in Austria and was later popularized in Italy and is prepared with steamed milk foam ...',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 5),
            child: Text(
              'Coffee Size',
              style: TextStyle(color: Color.fromRGBO(208, 202, 202, 1)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: Row(
              children: [
                for (int i = 1; i < 4; i++)
                  GestureDetector(
                    onTap: () {
                      selectImage(i);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: selectedImageIndex == i
                                ? ColorResources.lightOrange
                                : const Color.fromARGB(59, 233, 231, 231),
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.asset(
                          AppImages.coffeeSize,
                          height: i * 25,
                        ),
                      ),
                    ),
                  ),
                const Spacer(),
                if (bagProvider.isAlreadyInBag(
                    getCupSize(selectedImageIndex), widget.model.id))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: _increment,
                          child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: ColorResources.lightOrange,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${_selectedProduct?.quantity}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                        GestureDetector(
                          onTap: _decrement,
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: ColorResources.whiteColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
