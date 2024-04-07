import 'package:flutter/material.dart';
import 'package:multi_vendor_app/constants/uidata.dart';
import 'package:multi_vendor_app/views/home/widgets/food_tile.dart';

class FastestFoodPage extends StatelessWidget {
  const FastestFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Fastest Food',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: List.generate(
              foods.length,
              (index) {
                var food = foods[index];
                return FoodTile(food: food);
              },
            ),
          ),
        ),
      ),
    );
  }
}
