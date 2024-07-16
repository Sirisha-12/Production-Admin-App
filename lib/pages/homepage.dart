import 'package:firebase_production_app/controller/homecontroller.dart';
import 'package:firebase_production_app/pages/add_product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Electronics Admin',
                style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.products[index].name ?? ''),
                // title: const Text("name"),
                subtitle:
                    Text((controller.products[index].price ?? 0).toString()),
                // const Text("Price:300"),
                trailing: IconButton(
                    onPressed: () {
                      controller
                          .deleteProduct(controller.products[index].id ?? '');
                    },
                    icon: const Icon(Icons.delete)),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(const AddProduct());
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
