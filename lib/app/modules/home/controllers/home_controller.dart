import 'package:crud_get_x/app/data/models/product_model.dart';
import 'package:crud_get_x/app/data/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var products = List<Product>.empty().obs;

  void dialogError(String msg) {
    Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ));
  }

  void add(String name) {
    if (name != '') {
      final date = DateTime.now().toIso8601String();

      final product = Product(id: date, name: name, createdAt: date);
      products.add(product);
      Get.back();
    } else {
      dialogError('Masukkan produk terlebih dahulu');
    }
  }

  void delete(String id) {
    products.removeWhere((element) => element.id == id);
  }

  Product findById(String id) {
    return products.firstWhere((element) => element.id == id);
  }

  void edit(String id, String name) {
    // final product = products.firstWhere((element) => element.id == id);
    final product = findById(id);
    product.name = name;
    products.refresh();
    Get.back();
  }
}
