import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.food,
  });

  final dynamic food;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            height: 64,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              // color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 64,
                        width: 96,
                        child: Image.network(
                          food['imageUrl'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, bottom: 2),
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                          height: 16,
                          child: RatingBarIndicator(
                            rating: 5,
                            itemCount: 5,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber.shade300,
                            ),
                            itemSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food['title'],
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Delivery time ${food['time']}",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Contains: ",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        SizedBox(
                          width: 128,
                          height: 24,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: food['additives'].length,
                            itemBuilder: (context, index) {
                              var additive = food['additives'][index];
                              return Center(
                                child: Text(
                                  "${additive['title']} | ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 12,
            top: 8,
            child: SizedBox(
              width: 64,
              height: 24,
              child: Center(
                child: Text(
                  "\$ ${food['price'].toString()}",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 12,
            top: 40,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 64,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 16,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
