import 'package:coffee_shop/components/common_button.dart';
import 'package:coffee_shop/components/product_model.dart';
import 'package:coffee_shop/utils/bag_provider.dart';
import 'package:coffee_shop/utils/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BagScreen extends StatefulWidget {
  List<Product> cartList;
  BagScreen({super.key, required this.cartList});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      calculateSubTotal();
    });
  }

  void calculateSubTotal() {
    subTotal = 0;
    Provider.of<BagProvider>(context, listen: false).items.forEach((element) {
      subTotal += element.total;
    });
    setState(() {});
  }

  Widget slideRightBackground(int index) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: 90,
        width: 50,
        decoration: BoxDecoration(
            color: ColorResources.lightOrange,
            borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  double subTotal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
              color: Colors.white, size: 15 //change your color here
              ),
          automaticallyImplyLeading: true,
          title: const Text(
            'Show Bag',
            style: TextStyle(
                color: ColorResources.whiteColor,
                letterSpacing: 1,
                fontSize: 15),
          ),
        ),
        backgroundColor: Colors.black,
        body: Consumer<BagProvider>(builder: (context, cartList, child) {
          return cartList.items.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(
                          height: 450,
                          child: ListView.builder(
                              itemCount: cartList.items.length,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  direction: DismissDirection.endToStart,
                                  key: Key(cartList.items[index].id.toString()),
                                  background: slideRightBackground(index),
                                  confirmDismiss: (direction) async {
                                    if (direction ==
                                        DismissDirection.endToStart) {
                                      setState(() {
                                        cartList.items.removeAt(index);

                                        calculateSubTotal();
                                      });
                                    }
                                    return null;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Container(
                                      height: 120,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color.fromRGBO(64, 65, 74, 1),
                                                Color.fromRGBO(30, 30, 36, 1)
                                              ]),
                                          color: const Color.fromARGB(
                                              80, 112, 112, 121),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                                child: Image.asset(
                                                  cartList.items[index].image,
                                                  width: 100,
                                                  fit: BoxFit.fitWidth,
                                                )),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        cartList
                                                            .items[index].title,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 18,
                                                            color: ColorResources
                                                                .whiteColor),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    cartList.items[index]
                                                        .description,
                                                    style: const TextStyle(
                                                        color: ColorResources
                                                            .lightOrange,
                                                        fontSize: 12),
                                                  ),
                                                  const Spacer(),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '\$ ${cartList.items[index].total.toStringAsFixed(2)}',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 20,
                                                            color: ColorResources
                                                                .whiteColor),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 15,
                                                    backgroundColor:
                                                        ColorResources
                                                            .lightOrange,
                                                    child: Text(
                                                      cartList
                                                          .items[index].quantity
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          color: ColorResources
                                                              .whiteColor),
                                                    ),
                                                  ),
                                                  Text(
                                                    cartList
                                                        .items[index].cupSize
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: ColorResources
                                                            .whiteColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              })),

                     

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'SubTotal',
                            style: TextStyle(
                                color: ColorResources.whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text('\$ ${subTotal.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  color: ColorResources.whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tax',
                              style: TextStyle(
                                  color: ColorResources.whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400)),
                          Text('\$5.99',
                              style: TextStyle(
                                  color: ColorResources.whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Divider(
                          color: ColorResources.whiteColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total',
                              style: TextStyle(
                                  color: ColorResources.whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                          Text('\$ ${(subTotal + 5.99).toStringAsFixed(2)}',
                              style: const TextStyle(
                                  color: ColorResources.whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const Spacer(),
                      CommonButton(
                          text: 'CheckOut',
                          width: double.infinity,
                          callback: () {})
                    ],
                  ))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Lottie.asset('assets/images/addTobag.json'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Have some Coffee to Bag!!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorResources.whiteColor,
                          letterSpacing: 1.5,
                          fontSize: 18),
                    )
                  ],
                );
        }));
  }
}
