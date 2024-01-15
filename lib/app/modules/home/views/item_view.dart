import 'package:crud_get_x/app/data/models/product_model.dart';
import 'package:crud_get_x/app/modules/home/controllers/home_controller.dart';
import 'package:crud_get_x/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ItemView extends GetView<HomeController> {
  ItemView(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed(Routes.EDIT, arguments: product.id),
      leading: CircleAvatar(),
      title: Text(product.name!),
      subtitle: Text(product.createdAt!),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () => controller.delete(product.id!),
      ),
    );
  }
}
