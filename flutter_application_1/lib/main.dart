import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-Commerce Product Catalog",
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text("E-Commerce Catalog"),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Featured Products",
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.indigo
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.network(
                        "https://tse1.mm.bing.net/th/id/OIP.eLpgn4VsDeBfjK10iNKkpgHaF_?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3", // Smartphone image
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 8),
                      Text("Smartphone", style: TextStyle(fontSize: 18)),
                      Text("₹15,999", style: TextStyle(fontSize: 16, color: Colors.green)),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Buy"),
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    children: [
                      Image.network(
                        "https://th.bing.com/th/id/R.7ea882516a3d7e13972801b7912476e9?rik=kutJ22RN569Dtw&riu=http%3a%2f%2fpngimg.com%2fuploads%2fheadphones%2fheadphones_PNG7630.png&ehk=%2fR2nzVfGOe75ymWH6E4NLAvEvCijKmAu2%2bj3nReRQBo%3d&risl=&pid=ImgRaw&r=0", // Headphones image
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 8),
                      Text("Headphones", style: TextStyle(fontSize: 18)),
                      Text("₹1,999", style: TextStyle(fontSize: 16, color: Colors.green)),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Buy"),
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    children: [
                      Image.network(
                        "https://tse2.mm.bing.net/th/id/OIP.iXakUhcgDq2mqjAsAn4C_gHaHa?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3", // Coffee Maker image
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 8),
                      Text("Coffee Maker", style: TextStyle(fontSize: 18)),
                      Text("₹2,499", style: TextStyle(fontSize: 16, color: Colors.green)),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Buy"),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(thickness: 2, height: 40),
              Text(
                "Shop by Category",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.network(
                        "https://png.pngtree.com/png-clipart/20230817/original/pngtree-electronic-icon-set-electronics-icons-picture-image_8005626.png",
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        "Electronics",
                        style: TextStyle(
                          fontSize: 15, 
                          fontWeight: FontWeight.bold, 
                          color: Colors.deepPurple
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.network(
                        "https://static.vecteezy.com/system/resources/previews/047/308/664/non_2x/red-kitchen-appliances-on-a-white-background-free-png.png",
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        "Appliances",
                        style: TextStyle(
                          fontSize: 15, 
                          fontWeight: FontWeight.bold, 
                          color: Colors.deepPurple
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.network(
                        "https://png.pngtree.com/png-clipart/20201208/original/pngtree-clothing-and-fashion-icon-mens-or-womens-apparel-isolated-png-image_5513679.jpg",
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        "Fashion",
                        style: TextStyle(
                          fontSize: 15, 
                          fontWeight: FontWeight.bold, 
                          color: Colors.deepPurple
                        ),
                      ),
                    ],
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
