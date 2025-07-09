import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/courses/presentation/project_item.dart';
import 'package:portfolio/widgets/home_title_subtitle.dart';

class HomeProjectList extends StatelessWidget {
  const HomeProjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleSubtitle(
          title: context.text.projects,
          subtitle: context.text.projectsDescription,
        ),
        Gap(32),
        context.isDesktop
            ? _HomeProjectListDesktop()
            : _HomeProjectSlideMobile(),
      ],
    );
  }
}

class _HomeProjectListDesktop extends StatelessWidget {
  const _HomeProjectListDesktop();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (final p in AppProjects.projects)
            Flexible(
              flex: 3,
              child: FractionallySizedBox(
                widthFactor: 0.3 * AppProjects.projects.length,
                child: Material(elevation: 15, child: ProjectItem(p)),
              ),
            ),
        ],
      ),
    );
  }
}

class _HomeProjectSlideMobile extends StatelessWidget {
  const _HomeProjectSlideMobile();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.all(context.insets.padding),
          child: Row(
            spacing: context.insets.padding,
            children: [
              for (final p in AppProjects.projects)
                Material(child: SizedBox(width: 240, child: ProjectItem(p))),
            ],
          ),
        ),
      ),
    );
  }
}