// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_production_app/model/product/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productImageController = TextEditingController();

  String category = 'general';
  String brand = 'unbranded';
  bool offer = false;

  List<Product> products = [];

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
    await fetchProducts();
    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
          id: doc.id,
          name: productNameController.text,
          category: category,
          description: productDescriptionController.text,
          price: double.tryParse(productPriceController.text),
          brand: brand,
          image: productImageController.text,
          offer: offer);

      final productJson = product.toJson();
      doc.set(productJson);

      Get.snackbar('Success', 'Product addded succesfully',
          colorText: Colors.green);

      setValuesDefault();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      if (kDebugMode) {
        print(e);
      }
    }
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrivedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrivedProducts);

      Get.snackbar("Success", "Product fetch successfully",
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      if (kDebugMode) {
        print(e);
      }
    } finally {
      update();
    }
  }

  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      fetchProducts();
      Get.snackbar("Success", "Product deleted successfully",
          colorText: Colors.green);
      //     colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      if (kDebugMode) {
        print(e);
      }
    }
  }

  setValuesDefault() {
    productNameController.clear();
    productDescriptionController.clear();
    productPriceController.clear();
    productImageController.clear();

    category = 'general';
    brand = 'unbranded';
    offer = false;
    update();
  }
}
