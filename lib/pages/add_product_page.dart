// import 'package:flutter/foundation.dart';
import 'package:firebase_production_app/controller/homecontroller.dart';
import 'package:firebase_production_app/widgets/drop_down_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'Add Items',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Add new items",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      controller: controller.productNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter Item Name',
                          label: const Text('Product Name')),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      controller: controller.productDescriptionController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Enter product Description',
                        label: const Text('Description'),
                      ),
                      maxLines: 5,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      controller: controller.productImageController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter Image URL',
                          label: const Text('Image URL')),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      controller: controller.productPriceController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Enter Item Price',
                        label: const Text('Price'),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: DropDownBtn(
                              items: const [
                                'Headphones',
                                'Smart Watches',
                                'Mobile',
                                "Printer",
                                'Mouse'
                              ],
                              selectedItemtext: controller.category,
                              onSelected: (selectedValue) {
                                controller.category =
                                    selectedValue ?? 'general';
                                controller.update();
                              }),
                        ),
                        Flexible(
                          child: DropDownBtn(
                            onSelected: (selectedValue) {
                              controller.brand = selectedValue ?? 'unbranded';
                              controller.update();
                            },
                            items: const [
                              'Sony',
                              'OnePlus',
                              'Apple',
                              'Samsung'
                            ],
                            selectedItemtext: controller.brand,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text('Offer Products'),
                    const SizedBox(
                      height: 12,
                    ),
                    DropDownBtn(
                      items: const ['false', 'true'],
                      selectedItemtext: controller.offer.toString(),
                      onSelected: (selectedValue) {
                        controller.offer =
                            bool.tryParse(selectedValue ?? 'false') ?? false;
                        controller.update();
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.addProduct();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo),
                        child: const Text(
                          'Add Product',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
