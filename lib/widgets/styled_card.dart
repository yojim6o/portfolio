import 'package:flutter/cupertino.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/experiences/presentation/experience_body.dart';

class StyledCard extends StatefulWidget {
  const StyledCard({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
    this.borderEffect = false,
    required this.child,
  });

  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final bool borderEffect;
  final Widget child;

  @override
  State<StyledCard> createState() => _StyledCardState();
}

class _StyledCardState extends State<StyledCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.borderEffect) ...[
          const _CardBorderShadow(),
          //Positioned(bottom: 0, right: 0, child: _CardBorderShadow()),
        ],
        Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding ?? EdgeInsets.all(context.insets.cardPadding),
          decoration: BoxDecoration(
            border: Border.all(color: context.theme.colorScheme.outline),
            color: context.theme.cardColor,
            borderRadius:
                widget.borderRadius ??
                const BorderRadius.all(Radius.circular(24)),
          ),
          child: widget.child,
        ),
        if (widget.borderEffect) ...[
          CustomPaint(
            size: Size(widget.width ?? 0, widget.height ?? 0),
            painter: _CurvedLinePainter(context.theme.scaffoldBackgroundColor),
          ),
        ],
      ],
    );
  }
}

class _CurvedLinePainter extends CustomPainter {
  const _CurvedLinePainter(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void paint(Canvas canvas, Size size) {
    const lineSize = 60.0;
    final topLeftPaint = Paint()
      ..shader = LinearGradient(
        colors: [color.withAlpha(0), color, color.withAlpha(0)],
        begin: Alignment.topRight,
        end: Alignment.bottomRight,
      ).createShader(const Rect.fromLTWH(0, 0, lineSize, lineSize))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final bottomRightPaint = Paint()
      ..shader =
          LinearGradient(
            colors: [color.withAlpha(0), color, color.withAlpha(0)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ).createShader(
            Rect.fromLTWH(
              size.width - lineSize,
              size.height - lineSize,
              lineSize,
              lineSize,
            ),
          )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(lineSize, 0);
    path.cubicTo(0, 0, 0, 0, 0, lineSize);

    final path2 = Path();
    path.moveTo(size.width - lineSize, size.height);
    path.cubicTo(
      size.width,
      size.height,
      size.width,
      size.height,
      size.width,
      size.height - lineSize,
    );
    canvas.drawPath(path, topLeftPaint);
    canvas.drawPath(path2, bottomRightPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => true;
}

class _CardBorderShadow extends StatelessWidget {
  const _CardBorderShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: expWidth,
      height: expHeight,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.theme.scaffoldBackgroundColor
                .withRed(25)
                .withAlpha(125),
            blurRadius: 10,
            spreadRadius: -5,
            blurStyle: BlurStyle.solid,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
    );
  }
}