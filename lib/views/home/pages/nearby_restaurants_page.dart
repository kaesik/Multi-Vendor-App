import 'package:flutter/material.dart';

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
      body: const Center(
        child: Text('Nearby Restaurants'),
      ),
    );
  }
}
