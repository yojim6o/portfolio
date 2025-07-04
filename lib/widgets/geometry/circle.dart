import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';

class Circle extends StatelessWidget {
  Circle({super.key, required this.color, required this.size});

  final Color color;
  final double size;
  final Random ran = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        border: ran.nextInt(2) == 0
            ? Border.fromBorderSide(
                BorderSide(
                  color: context.theme.colorScheme.onSurface,
                  width: 4,
                ),
              )
            : null,
        borderRadius: BorderRadiusGeometry.only(
          topLeft: Radius.circular(ran.nextInt(1000).toDouble()),
          bottomLeft: Radius.circular(231),
          topRight: Radius.circular(ran.nextInt(1000).toDouble()),
          bottomRight: Radius.circular(ran.nextInt(1000).toDouble()),
        ),
      ),
    );
  }
}