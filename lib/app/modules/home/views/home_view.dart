import 'package:crud_get_x/app/modules/home/views/item_view.dart';
import 'package:crud_get_x/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALL PRODUCTS'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.ADD), icon: Icon(Icons.add))
        ],
      ),
      body: Obx(
        () => controller.products.isEmpty
            ? Center(
                child: Text('Belum ada data'),
              )
            : ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  final product = controller.products[index];
                  return ItemView(product);
                },
              ),
      ),
    );
  }
}
