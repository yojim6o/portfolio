import 'package:flutter/cupertino.dart';

class Line extends StatelessWidget {
  final Color color;
  final double size;

  const Line({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: size,
      child: Container(
        height: size,
        width: 2,
        decoration: BoxDecoration(color: color),
      ),
    );
  }
}