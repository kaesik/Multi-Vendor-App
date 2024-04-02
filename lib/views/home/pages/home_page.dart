import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/views/home/pages/fastest_food_page.dart';
import 'package:multi_vendor_app/views/home/pages/nearby_restaurants_page.dart';
import 'package:multi_vendor_app/views/home/pages/recomendations_page.dart';
import 'package:multi_vendor_app/views/home/widgets/category_list.dart';
import 'package:multi_vendor_app/views/home/widgets/food_list.dart';
import 'package:multi_vendor_app/views/home/widgets/nearby_restaurants_list.dart';
import 'package:multi_vendor_app/widgets/custom_appbar.dart';
import 'package:multi_vendor_app/widgets/heading.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
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
            const CategoryList(),
            Heading(
              text: 'Nearby Restaurants',
              onPressed: () {
                Get.to(() => const NearbyRestaurantsPage(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 500));
              },
            ),
            const NearbyRestaurants(),
            Heading(
              text: 'Recommendations',
              onPressed: () {
                Get.to(() => const RecommendationsPage(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 500));
              },
            ),
            const FoodList(),
            Heading(
              text: 'Food closer to you',
              onPressed: () {
                Get.to(() => const FastestFoodPage(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 500));
              },
            ),
            const FoodList(),
          ],
        ),
      ),
    );
  }
}
