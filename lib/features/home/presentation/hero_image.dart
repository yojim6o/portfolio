import 'package:flutter/cupertino.dart';
import 'package:portfolio/style/app_colors.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  final alpha = 80;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.pietGreen.withAlpha(alpha),
                spreadRadius: 2,
                blurRadius: 1,
                offset: Offset(9, 8),
              ),
              BoxShadow(
                color: AppColors.pietYellow.withAlpha(alpha),

                spreadRadius: 2,
                blurRadius: 1,
                offset: Offset(-2, -4),
              ),
              BoxShadow(
                color: AppColors.pietRed.withAlpha(alpha),
                spreadRadius: 2,
                blurRadius: 1,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: AspectRatio(
            aspectRatio: 3 / 3,
            child: ClipRRect(
              //borderRadius: const BorderRadius.all(Radius.elliptical(18, 19)),
              child: Image.asset('assets/images/me2.jpg', fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }
}