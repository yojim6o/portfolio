import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/experiences/presentation/experience_body.dart';
import 'package:portfolio/features/home/presentation/hero_widget.dart';
import 'package:portfolio/features/home/presentation/home_course_list.dart';
import 'package:portfolio/features/testimony/presentation/skill_list.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/appbar/my_app_bar.dart';
import 'package:portfolio/widgets/background_blur.dart';
import 'package:portfolio/widgets/my_footer.dart';

import '../../../widgets/home_title_subtitle.dart';

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
                        SliverToBoxAdapter(child: HeroWidget()),
                        SliverGap(context.insets.gap),
                        SliverToBoxAdapter(child: const HomeCourseList()),
                        SliverGap(context.insets.gap),
                        SliverToBoxAdapter(child: const ExperienceBody()),
                        SliverGap(context.insets.gap),
                        SliverToBoxAdapter(
                          child: HomeTitleSubtitle(
                            title: context.text.skills,
                            subtitle: context.text.skillsDescription,
                          ),
                        ),
                        const SliverGap(32),
                        SliverPadding(
                          sliver: SkillList(),
                          padding: EdgeInsets.symmetric(
                            horizontal: context.insets.padding,
                          ),
                        ),
                        SliverToBoxAdapter(child: MyFooter()),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const MyAppBar(),
          ],
        );
      },
    );
  }
}