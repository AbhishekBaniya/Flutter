import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_lib/controller/cart_controller.dart';
import 'dart:ui';
import 'package:get_x_lib/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: shoppingContainer(context),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add_shopping_cart_rounded, color: Colors.deepOrange,),
        onPressed: (){},
        label: GetX<CartController>(
          builder: (controller) {
            return Text(controller.count.toString());
          }
        ),
      ),
    );
  }
}

Column shoppingContainer(BuildContext context) {
  final cartController = Get.put(CartController());



  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Expanded(
        child: GetX<ShoppingController>(
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.products.length,
                itemBuilder: (context, position){
                  return Card(
                    margin: const EdgeInsets.all(12.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "\$${controller.products[position].productName}",
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                    ),
                                  ),

                                  Text(
                                    "\$${controller.products[position].productDescription}",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "${controller.products[position].price}",
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),

                          RaisedButton(
                            color: Theme.of(context).primaryColor,
                            splashColor: Colors.white10,
                              onPressed: (){
                                cartController.addToCart(
                                    controller.products[position]
                                );
                              },
                            child: const Text("Add to Cart",textDirection: TextDirection.ltr, style: TextStyle(color: Colors.white),),
                          ),
                        ],
                      ),
                    ),
                  );
                },
            );
          },
        ),
      ),

      GetX<CartController>(
        builder: (controller) {
          return Text(
            "Total Amount : \$ ${controller.totalPrice}",
            textDirection: TextDirection.ltr,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          );
        },
      ),

      const SizedBox(height: 100.0,),
    ],
  );
}

