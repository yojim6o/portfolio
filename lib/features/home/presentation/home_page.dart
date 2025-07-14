import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/experiences/presentation/experience_body.dart';
import 'package:portfolio/features/home/presentation/hero_widget.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/appbar/my_app_bar.dart';
import 'package:portfolio/widgets/my_footer.dart';

import '../../../widgets/background_blur.dart';
import '../../projects/presentation/projects_list.dart';
import '../../skills/presentation/skill_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            BackgroundBlur(),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: Insets.maxWidth),
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: HeroWidget(key: Keys.homeKey),
                        ),
                        SliverGap(context.insets.gap),
                        SliverToBoxAdapter(child: const HomeProjectList()),
                        SliverGap(context.insets.gap),
                        SliverToBoxAdapter(child: const ExperienceBody()),
                        SliverGap(context.insets.gap),
                        SliverToBoxAdapter(child: SkillList()),
                        SliverToBoxAdapter(child: MyFooter()),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            MyAppBar(),
          ],
        );
      },
    );
  }
}