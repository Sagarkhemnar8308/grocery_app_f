import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/model/advertisement_model.dart';
import 'package:grocery_app/model/product_model.dart';

class DatabaseService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  final CollectionReference advertisementCollection =
      FirebaseFirestore.instance.collection('advertisement');
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('Products');
  final FirebaseAuth auth = FirebaseAuth.instance;
    List<Product> favorteProduct = [];

  Stream<List<Advertisement>> getAllAdvertisements() {
    return advertisementCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Advertisement.fromFirestore(doc);
      }).toList();
    });
  }

  
  Future<List<Product>> getAllProducts() async {
    try {
      QuerySnapshot snapshot = await productCollection.get();
      List<Product> products = [];
      favorteProduct = []; 

      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        log("Fetched document data: ${data.toString()}");

        if (data.containsKey('products') && data['products'] is List) {
          List<dynamic> productList = data['products'];
          for (var productData in productList) {
            if (productData is Map<String, dynamic>) {
              Product product = Product.fromFirestore(productData);
              products.add(product);

              if (product.isFav) {
                favorteProduct.add(product);
              }
            } else {
              log("Invalid product entry: ${productData.toString()}");
            }
          }
        } else {
          log("Document does not contain a valid product list.");
        }
      }
      log("Fetched ${products.length} products successfully.");
      log("Fetched ${favorteProduct.length} favorite products successfully.");
      return products;
    } catch (e, stk) {
      log("Error fetching products: $e $stk");
      return [];
    }
  }

  Future<List<Product>> getAllFavoriteProducts() async {
    await getAllProducts();
    return favorteProduct;
  }
}
