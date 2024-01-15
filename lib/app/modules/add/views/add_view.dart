import 'package:crud_get_x/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
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
              onEditingComplete: () =>
                  Get.find<HomeController>().add(controller.name.text),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () =>
                    Get.find<HomeController>().add(controller.name.text),
                child: Text('ADD'))
          ]),
        ));
  }
}
