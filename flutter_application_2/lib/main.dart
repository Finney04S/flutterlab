import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce Product Catalog',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Product Catalog',
            style: TextStyle(fontSize: 20, letterSpacing: 8),
          ),
          backgroundColor: const Color.fromARGB(255, 200, 220, 255),
        ),
        body: ListView(
          children: [
            ProductListItem(
              productName: 'Smartphone',
              imageUrl: 'https://tse1.mm.bing.net/th/id/OIP.eLpgn4VsDeBfjK10iNKkpgHaF_?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3',
              price: 15999,
            ),
            ProductListItem(
              productName: 'Headphones',
              imageUrl: 'https://th.bing.com/th/id/R.7ea882516a3d7e13972801b7912476e9?rik=kutJ22RN569Dtw&riu=http%3a%2f%2fpngimg.com%2fuploads%2fheadphones%2fheadphones_PNG7630.png&ehk=%2fR2nzVfGOe75ymWH6E4NLAvEvCijKmAu2%2bj3nReRQBo%3d&risl=&pid=ImgRaw&r=0',
              price: 1999,
            ),
            ProductListItem(
              productName: 'Coffee Maker',
              imageUrl: 'https://tse2.mm.bing.net/th/id/OIP.iXakUhcgDq2mqjAsAn4C_gHaHa?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3',
              price: 2499,
            ),
            ProductListItem(
              productName: 'Smartwatch',
              imageUrl: 'https://png.pngtree.com/png-clipart/20240318/original/pngtree-smart-watch-electronic-device-3d-illustration-png-image_14615019.png',
              price: 3999,
            ),
            ProductListItem(
              productName: 'DSLR Camera',
              imageUrl: 'https://png.pngtree.com/png-clipart/20231003/original/pngtree-dslr-camera-3d-rendering-png-image_13082822.png',
              price: 29999,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductListItem extends StatelessWidget {
  final String productName, imageUrl;
  final double price;
  ProductListItem({super.key, required this.productName, required this.imageUrl, required this.price});

  final inrFormat = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 2);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey, width: 0.5),
      ),
      elevation: 2,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            color: Colors.grey[200],
            width: 150,
            height: 150,
            child: Image.network(
              imageUrl,
              width: 110,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              SizedBox(height: 20),
              Text(inrFormat.format(price), style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                child: Text('Buy Now'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
