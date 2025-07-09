import 'package:flutter/cupertino.dart';
import 'package:portfolio/style/app_colors.dart';

class HeroImage extends StatefulWidget {
  const HeroImage({super.key});

  @override
  State<HeroImage> createState() => _HeroImageState();
}

class _HeroImageState extends State<HeroImage> with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> _animationY;
  late final Animation<double> _animationG;
  late final Animation<double> _animationR;
  late final Animation<double> _animationImage;
  final alpha = 80;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    _animationG = Tween<double>(begin: -500, end: 9).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.25, curve: Curves.easeInExpo),
      ),
    );

    _animationY = Tween<double>(begin: -500, end: -2).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.20, 0.45, curve: Curves.easeInExpo),
      ),
    );

    _animationR = Tween<double>(begin: -500, end: 4).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.4, 0.65, curve: Curves.easeInExpo),
      ),
    );
    _animationImage = Tween<double>(begin: -500, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.60, 1, curve: Curves.easeInOutCirc),
      ),
    );
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () => controller.forward());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.pietGreen.withAlpha(alpha),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: Offset(_animationG.value, 8),
                  ),
                  BoxShadow(
                    color: AppColors.pietYellow.withAlpha(alpha),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: Offset(_animationY.value, -4),
                  ),
                  BoxShadow(
                    color: AppColors.pietRed.withAlpha(alpha),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: Offset(_animationR.value, 4),
                  ),
                ],
              ),
              child: Transform.translate(
                offset: Offset(_animationImage.value, 0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/me2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}