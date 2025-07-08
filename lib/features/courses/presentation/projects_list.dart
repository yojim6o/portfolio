import 'package:flutter/cupertino.dart';
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
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final p in AppProjects.projects) Expanded(child: ProjectItem(p)),
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
        child: Row(
          spacing: context.insets.padding,
          children: [
            for (final p in AppProjects.projects)
              SizedBox(width: 240, child: ProjectItem(p)),
          ],
        ),
      ),
    );
  }
}