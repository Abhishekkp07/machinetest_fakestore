import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../presentation/cart/controller/cart_controller.dart';
import '../presentation/cart/view/cart_screen.dart';
import '../respository/api/cart/model/cart_model.dart';

class Itemcard extends StatelessWidget {
  final String? title;
  final double? price;
  final String? image;
  final String? category;

  const Itemcard({super.key, this.title, this.price, this.image, this.category});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final cartController = Provider.of<CartController>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: height * 0.2,  // Adjust height as needed
                  width: double.infinity, // Make image take full width
                  child: Image.network(image ?? "", fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 10),
              Text(
                title ?? "",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$$price",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(category ?? ""),
              Spacer(),  // Pushes buttons to the bottom
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        cartController.addToCart(CartItem(
                          title: title,
                          price: price,
                          image: image,
                          category: category,
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("$title added to cart")),
                        );
                      },
                      child: Text("Add to Cart"),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(),
                          ),
                        );
                      },
                      child: Text("View Cart"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
