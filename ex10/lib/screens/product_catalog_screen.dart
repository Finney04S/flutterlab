import 'package:flutter/material.dart';

class ProductCatalogScreen extends StatelessWidget {
  const ProductCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample product data
    final List<Map<String, String>> products = [
      {'name': 'Laptop', 'price': '\$999', 'description': 'High-performance laptop'},
      {'name': 'Smartphone', 'price': '\$699', 'description': 'Latest smartphone'},
      {'name': 'Headphones', 'price': '\$199', 'description': 'Noise-cancelling headphones'},
      {'name': 'Tablet', 'price': '\$499', 'description': 'Portable tablet'},
      {'name': 'Smartwatch', 'price': '\$299', 'description': 'Fitness smartwatch'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(product['name']!),
              subtitle: Text(product['description']!),
              trailing: Text(product['price']!),
              onTap: () {
                // Handle product tap, e.g., navigate to product details
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected ${product['name']}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
