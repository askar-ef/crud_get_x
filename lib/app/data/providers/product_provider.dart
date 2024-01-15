import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductProvider extends GetConnect {
  String url =
      "https://getxcli-92af6-default-rtdb.asia-southeast1.firebasedatabase.app/";

  Future<Product?> getProduct(int id) async {
    final response = await get('product/$id');
    return response.body;
  }

  Future<dynamic> postProduct(String name, String date) async {
    final response = await post('${url}products.json', {
      "name": name,
      "createdAt": date,
    });
    return response.body;
  }

  Future<Response> deleteProduct(int id) async => await delete('product/$id');
}
