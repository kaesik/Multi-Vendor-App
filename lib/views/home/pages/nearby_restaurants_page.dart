import 'package:flutter/material.dart';
import 'package:multi_vendor_app/constants/uidata.dart';
import 'package:multi_vendor_app/views/home/widgets/restaurant_tile.dart';

class NearbyRestaurantsPage extends StatelessWidget {
  const NearbyRestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Nearby Restaurants',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: List.generate(
              restaurants.length,
              (index) {
                var restaurant = restaurants[index];
                return RestaurantTile(restaurant: restaurant);
              },
            ),
          ),
        ),
      ),
    );
  }
}
