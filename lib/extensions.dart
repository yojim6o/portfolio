import 'package:flutter/material.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/style/app_text_styles.dart';

enum FormFactorType { mobile, tablet, desktop }

extension StyledContext on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);

  double get width => mq.size.width;

  double get height => mq.size.height;

  FormFactorType get formFactor {
    if (width < 600) {
      return FormFactorType.mobile;
    } else if (width < 900) {
      return FormFactorType.tablet;
    }
    return FormFactorType.desktop;
  }

  bool get isMobile => formFactor == FormFactorType.mobile;

  bool get isTablet => formFactor == FormFactorType.tablet;

  bool get isDesktop => formFactor == FormFactorType.desktop;

  bool get isDesktopOrTable => isTablet || isDesktop;

  ApptextStyle get textStyle {
    switch (formFactor) {
      case FormFactorType.mobile:
      case FormFactorType.tablet:
        return SmallTextStyle();
      case FormFactorType.desktop:
        return LargeTextStyle();
    }
  }

  AppInsets get insets {
    switch (formFactor) {
      case FormFactorType.mobile:
        return SmallInsets();
      case FormFactorType.tablet:
        return MediumInsets();
      case FormFactorType.desktop:
        return LargeInsets();
    }
  }

  ThemeData get theme => Theme.of(this);

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  AppLocalizations get text =>
      AppLocalizations.of(this) ?? lookupAppLocalizations(const Locale('en'));
}