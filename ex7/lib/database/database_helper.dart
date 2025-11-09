import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static DatabaseHelper? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  Future<String> insertProduct(Product product) async {
    final docRef = await firestore.collection('products').add(product.toMap());
    return docRef.id;
  }

  Future<List<Product>> getProducts() async {
    final querySnapshot = await firestore.collection('products').get();
    return querySnapshot.docs.map((doc) {
      return Product.fromMap(doc.data(), doc.id);
    }).toList();
  }

  Future<void> updateProduct(Product product) async {
    await firestore.collection('products').doc(product.id).update(product.toMap());
  }

  Future<void> deleteProduct(String id) async {
    await firestore.collection('products').doc(id).delete();
  }

  Future<List<Product>> searchProducts(String query) async {
    final querySnapshot = await firestore
        .collection('products')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: query + '\uf8ff')
        .get();
    return querySnapshot.docs.map((doc) {
      return Product.fromMap(doc.data(), doc.id);
    }).toList();
  }
}
