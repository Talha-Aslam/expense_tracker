import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
  });

  final double fill;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                // Color.fromARGB(226, 124, 182, 240),
                Colors.black,
                Color.fromARGB(108, 152, 106, 36),
                Color.fromARGB(0, 255, 255, 255),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
          ),
        ),
      ),
    );
  }
}
