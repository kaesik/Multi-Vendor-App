import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/controllers/tab_index_controller.dart';
import 'package:multi_vendor_app/views/cart/pages/cart_page.dart';
import 'package:multi_vendor_app/views/home/pages/home_page.dart';
import 'package:multi_vendor_app/views/profile/pages/profile_page.dart';
import 'package:multi_vendor_app/views/search/pages/search_page.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Get.put(TabIndexController());

    return Obx(() {
      return Scaffold(
        body: Stack(
          children: [
            pageList[controller.selectedIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data: Theme.of(context).copyWith(),
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.onBackground.withOpacity(0.05),
                        blurRadius: 32,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    selectedItemColor: theme.colorScheme.secondary,
                    unselectedItemColor: theme.colorScheme.primary,
                    elevation: 16,
                    iconSize: 32,
                    onTap: (index) {
                      controller.setTabIndex = index;
                    },
                    currentIndex: controller.selectedIndex,
                    items: [
                      BottomNavigationBarItem(
                        icon: controller.selectedIndex == 0
                            ? const Icon(Icons.home)
                            : const Icon(Icons.home_outlined),
                        label: 'Home',
                      ),
                      const BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: 'Search',
                      ),
                      BottomNavigationBarItem(
                        icon: controller.selectedIndex == 2
                            ? const Badge(
                                label: Text("12"),
                                child: Icon(Icons.shopping_cart),
                              )
                            : const Badge(
                                label: Text("12"),
                                child: const Icon(Icons.shopping_cart_outlined),
                              ),
                        label: 'Cart',
                      ),
                      BottomNavigationBarItem(
                        icon: controller.selectedIndex == 3
                            ? const Icon(Icons.person)
                            : const Icon(Icons.person_outlined),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
