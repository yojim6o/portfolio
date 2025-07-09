import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:portfolio/style/app_colors.dart';
import 'package:portfolio/widgets/geometry/triangle.dart';

import 'geometry/circle.dart';
import 'geometry/line.dart';
import 'geometry/square.dart';

class BackgroundBlur extends StatelessWidget {
  BackgroundBlur({super.key});

  final Random rnd = Random();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxW = constraints.maxWidth.toInt();
        final maxH = constraints.maxHeight.toInt();

        return _RandomPositioned(maxH: maxH, maxW: maxW);
      },
    );
  }
}

enum Shape { square, circle, line, triangle }

class _RandomPositioned extends StatelessWidget {
  final int maxH;
  final int maxW;
  final Random rnd = Random();

  _RandomPositioned({required this.maxH, required this.maxW});

  @override
  Widget build(BuildContext context) {
    return Stack(children: generateList());
  }

  List<Widget> generateList() {
    final List<Widget> output = [];
    for (var i = 0; i < 10; i++) {
      final shape = Shape.line;
      final color = AppColors.miroList.elementAt(rnd.nextInt(5));

      switch (shape) {
        case Shape.triangle:
          output.add(
            _buildShape(
              Triangle(color: color, size: rnd.nextInt(200).toDouble()),
            ),
          );
          break;
        case Shape.square:
          output.add(
            _buildShape(
              Square(color: color, size: rnd.nextInt(200).toDouble()),
            ),
          );
          break;
        case Shape.line:
          output.add(
            _buildShape(Line(color: color, size: rnd.nextInt(maxH).toDouble())),
          );
          break;
        case Shape.circle:
          output.add(
            _buildShape(
              Circle(color: color, size: rnd.nextInt(200).toDouble()),
            ),
          );
          break;
      }
    }

    return output;
  }

  Positioned _buildShape(Widget child) {
    return Positioned(
      top: rnd.nextInt(maxH).toDouble(),
      left: rnd.nextInt(maxW).toDouble(),
      child: child,
    );
  }
}