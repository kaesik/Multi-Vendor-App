import 'package:flutter/material.dart';
import 'package:multi_vendor_app/constants/uidata.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192,
      padding: const EdgeInsets.only(left: 12, top: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          foods.length,
          (index) {
            var food = foods[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 256,
                width: 256,
                color: Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }
}
