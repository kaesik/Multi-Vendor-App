import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({
    super.key,
    required this.image,
    required this.logo,
    required this.title,
    required this.time,
    required this.rating,
    this.onTap,
  });

  final String image;
  final String logo;
  final String title;
  final String time;
  final String rating;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          width: 256,
          height: 192,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.background,
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: 256,
                      height: 128,
                      child: Image.network(
                        image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(64),
                      child: Container(
                        color: Theme.of(context).colorScheme.primary,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(64),
                            child: Image.network(
                              logo,
                              fit: BoxFit.cover,
                              width: 16,
                              height: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery time',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        Text(
                          time,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: 5,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          itemCount: 5,
                          itemSize: 16,
                        ),
                        Text(
                          " $rating+ reviews",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
