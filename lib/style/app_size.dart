class Insets {
  static double get xxl => 48;

  static double get xl => 24;

  static double get lg => 16;

  static double get med => 12;

  static double get sm => 8;

  static double get xs => 4;

  static const double maxWidth = 1280;
}

abstract class AppInsets {
  double get padding;

  double get appBarHeight;

  double get cardPadding;

  double get gap;
}

class LargeInsets extends AppInsets {
  @override
  double get padding => 70;

  @override
  double get appBarHeight => 58;

  @override
  double get cardPadding => Insets.xl;

  @override
  double get gap => 120;
}

class MediumInsets extends AppInsets {
  @override
  double get padding => 32;

  @override
  double get appBarHeight => 60;

  @override
  double get cardPadding => Insets.lg;

  @override
  double get gap => 60;
}

class SmallInsets extends AppInsets {
  @override
  double get padding => 16;

  @override
  double get appBarHeight => 56;

  @override
  double get cardPadding => Insets.med;

  @override
  double get gap => 40;
}