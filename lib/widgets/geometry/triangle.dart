import 'dart:math';

import 'package:flutter/cupertino.dart';

class Triangle extends StatelessWidget {
  Triangle({super.key, required this.color, required this.size});

  final Color color;
  final double size;
  final Random rnd = Random();

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: size.toInt(),
      child: rnd.nextInt(2) == 0
          ? _FilledTriangle(color, size)
          : _EmptyTriangle(color, size),
    );
  }
}

class _FilledTriangle extends StatelessWidget {
  const _FilledTriangle(this.color, this.size);

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _TriangleClipper(),
      child: Container(color: color, width: size, height: size),
    );
  }
}

class _EmptyTriangle extends StatelessWidget {
  const _EmptyTriangle(this.color, this.size);

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _TrianglePainter(color)),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;

  _TrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}