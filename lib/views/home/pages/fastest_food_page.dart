import 'package:flutter/material.dart';

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
      body: const Center(
        child: Text('Fastest Food'),
      ),
    );
  }
}
