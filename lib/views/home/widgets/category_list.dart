import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/constants/uidata.dart';
import 'package:multi_vendor_app/controllers/category_controller.dart';
import 'package:multi_vendor_app/views/categories/all_categories.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Container(
      height: 72,
      padding: const EdgeInsets.only(left: 12, top: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          categories.length,
          (index) {
            var category = categories[index];
            return GestureDetector(
              onTap: () {
                if (controller.categoryValue == category['_id']) {
                  controller.setCategory = '';
                  controller.setTitle = '';
                } else if (category['value'] == 'more') {
                  Get.to(() => const AllCategories(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 500));
                } else {
                  controller.setCategory = category['_id'];
                  controller.setTitle = category['title'];
                }
              },
              child: Obx(
                () => Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.only(top: 4),
                  width: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: controller.categoryValue == category['_id']
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.background,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 32,
                        child: Image.network(
                          category['imageUrl'],
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        '${category['title']}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
