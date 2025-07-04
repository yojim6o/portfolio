import 'package:flutter/cupertino.dart';

class Square extends StatelessWidget {
  final Color color;
  final double size;

  const Square({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: size,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.rectangle),
      ),
    );
  }
}