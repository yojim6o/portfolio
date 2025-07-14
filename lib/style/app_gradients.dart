import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradients {
  AppGradients._();

  static RadialGradient appBarGradient({required double radius}) =>
      RadialGradient(
        tileMode: TileMode.clamp,
        stops: [
          0.0,
          0.259,
          0.26,
          0.269,
          0.27,
          0.409,
          0.41,
          0.419,
          0.42,
          0.739,
          0.74,
          0.745,
          0.746,
        ],
        colors: [
          AppColors.pietYellow,
          AppColors.pietYellow,
          Colors.black,
          Colors.black,
          AppColors.pietGreen,
          AppColors.pietGreen,
          Colors.black,
          Colors.black,
          AppColors.pietBlue,
          AppColors.pietBlue,
          Colors.black,
          Colors.black,
          AppColors.pietRed,
        ],
        radius: radius,
        center: Alignment.center,
        focal: Alignment.bottomLeft,
      );

  static RadialGradient cardGradient({required double radius}) =>
      RadialGradient(
        tileMode: TileMode.clamp,
        stops: [
          0.0,
          0.259,
          0.26,
          0.269,
          0.27,
          0.409,
          0.41,
          0.419,
          0.42,
          0.759,
          0.76,
          0.769,
          0.77,
        ],
        colors: [
          AppColors.pietYellow,
          AppColors.pietYellow,
          Colors.black,
          Colors.black,
          AppColors.pietGreen,
          AppColors.pietGreen,
          Colors.black,
          Colors.black,
          AppColors.pietBlue,
          AppColors.pietBlue,
          Colors.black,
          Colors.black,
          AppColors.pietRed,
        ],
        radius: radius,
        center: Alignment.center,
        focal: Alignment.centerLeft,
      );
}