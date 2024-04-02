import 'package:flutter/material.dart';
import 'package:multi_vendor_app/constants/uidata.dart';
import 'package:multi_vendor_app/views/categories/widgets/category_tile.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

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
                return CategoryTile(category: category);
              },
            ),
          ),
        ),
      ),
    );
  }
}
