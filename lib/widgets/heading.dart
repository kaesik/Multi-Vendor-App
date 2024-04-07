import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(padding: EdgeInsets.only(left: 24)),
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.grid_view_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
