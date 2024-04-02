import 'package:flutter/material.dart';

class RecommendationsPage extends StatelessWidget {
  const RecommendationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Recommendations',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const Center(
        child: Text('Recommendations'),
      ),
    );
  }
}
