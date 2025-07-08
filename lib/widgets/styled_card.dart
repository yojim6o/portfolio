import 'package:flutter/cupertino.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_colors.dart';

import '../features/experiences/presentation/experience_item.dart';

class StyledCard extends StatefulWidget {
  const StyledCard({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
    this.borderEffect = false,
    required this.child,
    this.color,
  });

  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Color? color;
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
        Center(
          child: Container(
            width: widget.width,
            height: widget.height,
            padding:
                widget.padding ?? EdgeInsets.all(context.insets.cardPadding),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.pietRed, width: 0.1),
              color: widget.color ?? context.theme.cardColor,
              /*borderRadius:
                  widget.borderRadius ??
                  const BorderRadius.all(Radius.circular(24)),*/
            ),
            child: widget.child,
          ),
        ),
      ],
    );
  }
}

class _CardBorderShadow extends StatelessWidget {
  const _CardBorderShadow();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: expWidth,
      height: expHeight,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.theme.scaffoldBackgroundColor
                .withRed(55)
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