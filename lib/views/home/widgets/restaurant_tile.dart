import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({
    super.key,
    required this.restaurant,
  });

  final dynamic restaurant;

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
                borderRadius: BorderRadius.circular(8)),
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
                          restaurant['imageUrl'],
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
                      restaurant['title'],
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Delivery time ${restaurant['time']}",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    SizedBox(
                      width: 256,
                      child: Text(
                        restaurant['coords']['address'],
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
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
                  restaurant['isAvailable'] == true ||
                          restaurant['isAvailable'] == null
                      ? 'Open'
                      : 'Closed',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: restaurant['isAvailable'] == true ||
                                restaurant['isAvailable'] == null
                            ? Colors.green.shade400
                            : Colors.red.shade300,
                        fontWeight: FontWeight.bold,
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
