import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/constants/uidata.dart';
import 'package:multi_vendor_app/views/categories/category_page.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'All Categories',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 12, top: 8),
        child: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              categories.length,
              (index) {
                var category = categories[index];
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
              },
            ),
          ),
        ),
      ),
    );
  }
}
