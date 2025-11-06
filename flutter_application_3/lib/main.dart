import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  String name;
  double price;
  int stock;
  Product({required this.name, required this.price, required this.stock});
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Product> productList = [
    Product(name: "Smartphone", price: 15999, stock: 5),
    Product(name: "Headphones", price: 1999, stock: 8),
    Product(name: "Coffee Maker", price: 2499, stock: 4),
    Product(name: "Smartwatch", price: 3999, stock: 7),
    Product(name: "DSLR Camera", price: 29999, stock: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-Commerce Product Catalog",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product Catalog'),
          backgroundColor: Color.fromARGB(255, 70, 130, 180),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final product = productList[index];
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text(product.name[0]),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),
                  title: Text(product.name),
                  subtitle: Text("₹${product.price.toStringAsFixed(2)}, Stock: ${product.stock}"),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Order Confirmation"),
                          content: Text("Your order for ${product.name} has been placed!"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("OK"),
                            )
                          ],
                        ),
                      );
                    },
                    child: Text("Order Now"),
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${product.name} selected."),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                Divider(thickness: 1),
              ],
            );
          },
        ),
      ),
    );
  }
}
