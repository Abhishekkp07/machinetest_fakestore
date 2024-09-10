import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        centerTitle: true,
      ),
      body: cartController.cartItems.isEmpty
          ? Center(child: Text("Your cart is empty"))
          : ListView.builder(
        itemCount: cartController.cartItems.length,
        itemBuilder: (context, index) {
          var item = cartController.cartItems[index];
          return ListTile(
            leading: Image.network(item.image ?? ""),
            title: Text(item.title ?? ""),
            subtitle: Text("\$${item.price.toString()}"),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                cartController.removeFromCart(item);
              },
            ),
          );
        },
      ),
    );
  }
}
