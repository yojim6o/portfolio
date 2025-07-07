import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/courses/presentation/project_item.dart';
import 'package:portfolio/widgets/home_title_subtitle.dart';

class HomeCourseList extends StatelessWidget {
  const HomeCourseList({super.key});

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
        context.isDesktop ? _HomeCourseListDesktop() : _HomeCourseSlideMobile(),
      ],
    );
  }
}

class _HomeCourseListDesktop extends StatelessWidget {
  const _HomeCourseListDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Row(
        spacing: 16,
        children: [
          Expanded(child: CourseItem()),
          Expanded(child: CourseItem()),
          Expanded(child: CourseItem()),
        ],
      ),
    );
  }
}

class _HomeCourseSlideMobile extends StatelessWidget {
  const _HomeCourseSlideMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 240, child: CourseItem()),
            SizedBox(width: 240, child: CourseItem()),
            SizedBox(width: 240, child: CourseItem()),
          ],
        ),
      ),
    );
  }
}