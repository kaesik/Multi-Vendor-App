import 'package:flutter/material.dart';
import 'package:multi_vendor_app/views/home/widgets/category_list.dart';
import 'package:multi_vendor_app/widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(128),
        child: CustomAppBar(),
      ),
      body: Center(
        child: Column(
          children: [
            Divider(
              indent: 24,
              endIndent: 24,
              thickness: 1,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
            ),
            CategoryList(),
            Text('Home Page'),
          ],
        ),
      ),
    );
  }
}
