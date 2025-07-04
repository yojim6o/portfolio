import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/testimony/presentation/skill_item.dart';

class SkillList extends StatelessWidget {
  const SkillList({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isDesktopOrTable ? _DesktopSkills() : _MobileSkills();
  }
}

class _DesktopSkills extends StatelessWidget {
  const _DesktopSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid(
      delegate: SliverChildBuilderDelegate((builder, context) {
        return SkillItem();
      }, childCount: 10),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,

      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isDesktop ? 3 : 2,
      ),
    );
  }
}

class _MobileSkills extends StatelessWidget {
  const _MobileSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return SkillItem();
      },
      separatorBuilder: (context, index) => const Gap(16),
    );
  }
}