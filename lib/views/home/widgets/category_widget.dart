import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/controllers/category_controller.dart';
import 'package:multi_vendor_app/views/categories/pages/all_categories_page.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    this.category,
  });

  var category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return GestureDetector(
      onTap: () {
        if (controller.categoryValue == category['_id']) {
          controller.setCategory = '';
          controller.setTitle = '';
        } else if (category['value'] == 'more') {
          Get.to(() => const AllCategoriesPage(),
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
  }
}
