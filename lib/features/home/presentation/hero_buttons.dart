import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widgets/appbar/styled_buttons.dart';

class LargeHeroButtons extends StatelessWidget {
  const LargeHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PrimaryButton(
          title: "LinkedIn",
          onPressed: () => Utils.launchUri(AppUrl.linkedinUri),
        ),
        Gap(Insets.lg),
        OutlineButton(
          title: "Github",
          onPressed: () => Utils.launchUri(AppUrl.githubUri),
        ),
      ],
    );
  }
}

class SmallHeroButtons extends StatelessWidget {
  const SmallHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(title: "LinkedIn"),
        ),
        Gap(Insets.lg),
        SizedBox(
          width: double.infinity,
          child: OutlineButton(title: "GitHub"),
        ),
      ],
    );
  }
}