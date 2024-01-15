import 'package:crud_get_x/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  @override
  Widget build(BuildContext context) {
    final productName = Get.find<HomeController>().findById(Get.arguments);
    controller.name.text = productName.name!;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Product'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: ListView(children: [
            TextField(
              autocorrect: false,
              controller: controller.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Product Name',
                hintText: 'Input product name here ...',
              ),
              onEditingComplete: () => Get.find<HomeController>().edit(
                Get.arguments,
                controller.name.text,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () => Get.find<HomeController>()
                    .edit(Get.arguments, controller.name.text),
                child: Text('EDIT'))
          ]),
        ));
  }
}
