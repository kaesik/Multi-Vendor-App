import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/views/categories/pages/category_page.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({
    super.key,
    required this.category,
  });

  var category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() => const CategoryPage(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 500));
      },
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Image.network(
          category['imageUrl'],
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        '${category['title']}',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(context).colorScheme.primary,
        size: 16,
      ),
    );
  }
}
