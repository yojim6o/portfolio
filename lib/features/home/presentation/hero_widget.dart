import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/home/presentation/hero_buttons.dart';
import 'package:portfolio/features/home/presentation/hero_image.dart';
import 'package:portfolio/features/home/presentation/hero_text.dart';
import 'package:portfolio/style/app_size.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Container(
        margin: EdgeInsets.only(top: context.insets.appBarHeight * 1.5),
        child: context.isDesktopOrTable ? LargeHero() : SmallHero(),
      ),
    );
  }
}

class SmallHero extends StatelessWidget {
  const SmallHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 140),
          child: HeroImage(),
        ),
        Gap(Insets.xl),
        const HeroText(),
        Gap(Insets.xxl),
        const SmallHeroButtons(),
      ],
    );
  }
}

class LargeHero extends StatelessWidget {
  const LargeHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(child: HeroImage()),
        Gap(Insets.xl),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeroText(),
              Gap(Insets.xxl),
              const LargeHeroButtons(),
            ],
          ),
        ),
      ],
    );
  }
}