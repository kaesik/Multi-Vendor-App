import 'package:flutter/material.dart';
import 'package:multi_vendor_app/constants/uidata.dart';
import 'package:multi_vendor_app/views/home/widgets/restaurant_widget.dart';

class NearbyRestaurants extends StatelessWidget {
  const NearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 224,
      padding: const EdgeInsets.only(left: 12, top: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          restaurants.length,
          (index) {
            var restaurant = restaurants[index];
            return RestaurantWidget(
              image: restaurant['imageUrl'],
              logo: restaurant['logoUrl'],
              title: restaurant['title'],
              time: restaurant['time'],
              rating: restaurant['ratingCount'],
            );
          },
        ),
      ),
    );
  }
}
