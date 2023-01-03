import 'dart:io';
import 'dart:ui';

import 'package:coffee_shop/colors/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductDetailedScreen extends StatefulWidget {
  const ProductDetailedScreen({super.key});

  @override
  State<ProductDetailedScreen> createState() => _ProductDetailedScreenState();
}

class _ProductDetailedScreenState extends State<ProductDetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
      margin: EdgeInsets.all(20),
      //  color: ColorResources.lightOrange,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Column(
          children: [
            const Text('Price', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.659)),),
            const Text('\$ 45.30', style: TextStyle(
              fontSize: 20,
              color: ColorResources.whiteColor),)
          ],
        ),

        SizedBox(width: 30,),
        Expanded(
          child: MaterialButton(onPressed: (){},
          height: 50,
          color: ColorResources.lightOrange,
          shape: 
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              // side: const BorderSide(color: Colors.red)
            ),
          
          child: const Text('Buy Now', style: TextStyle(color: ColorResources.whiteColor),),
          ),
        )
      ],)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                'https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg',
                height: 450,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: 10,
             
                  child: Container(
                    height: 140,
                    width: 330,
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(85, 74, 74, 0.689)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text('Capaccino', style: TextStyle(color: Colors.white, fontSize: 20),),
                          SizedBox(height: 10,),
                        Text('With Oat Milk', style: TextStyle(color: Colors.white),),
                        
                       
                                
                        ],),
                        Spacer(),
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
                            
                            'https://toppng.com/uploads/preview/beans-vector-svg-coffee-bean-icon-11563234646tcumnuunra.png',
                            height: 30,
                            
                      // color: ColorResources.lightOrange,
                          ),
                        ),
                      ),
                                      
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
                            
                            'https://i.pinimg.com/474x/76/fe/df/76fedf51c189e1f5a573155b37d3c9fc.jpg',
                            height: 30,
                            
                            // color: ColorResources.lightOrange,
                          ),
                        ),
                      ),
                      ],),
                    ),
                                    
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Expanded(
                      flex: 1,
                        child: Icon(Icons.star, color: ColorResources.lightOrange,)),
                      Expanded(
                        flex: 1,
                        child: Text('4.5(6,100)', style: TextStyle(color: ColorResources.whiteColor),
                        
                        ),
                      ),
                          SizedBox(width: 30,),         
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorResources.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                            
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Medium Roasted', style: TextStyle(color: ColorResources.whiteColor),),
                            ),),
                        ),
                      )
                                    
                    ],)
                                    ],),),
                ),
              
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Description',
              style: TextStyle(color: Color.fromRGBO(208, 202, 202, 0.899)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'A cappuccino is an espresso-based coffee drink that originated in Austria and was later popularized in Italy and is prepared with steamed milk foam ...',
              style: TextStyle(color: Color.fromRGBO(208, 202, 202, 0.899)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Size',
              style: TextStyle(color: Color.fromRGBO(208, 202, 202, 0.899)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorResources.lightOrange),
                    borderRadius: BorderRadius.circular(10),
                    //color: Color.fromRGBO(62, 63, 75, 0.611),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                        child: Text(
                      'S',
                      style: TextStyle(color: ColorResources.whiteColor),
                    )),
                  ),
                ),
                Container(
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(62, 63, 75, 0.611),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                        child: Text(
                      'M',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                Container(
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(62, 63, 75, 0.611),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                        child: Text(
                      'L',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
