import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/appbar/drawer_menu.dart';

class AppBarWrapperIcon extends ConsumerStatefulWidget {
  const AppBarWrapperIcon({super.key});

  @override
  ConsumerState<AppBarWrapperIcon> createState() => _AppBarWrapperIconState();
}

class _AppBarWrapperIconState extends ConsumerState<AppBarWrapperIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  bool isOpen = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          if (!isOpen) {
            controller.forward();
          } else {
            controller.reverse();
          }
          isOpen = !isOpen;
          ref.read(drawerMenuControllerProvider.notifier).toggle();
        });
      },
      icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: animation),
    );
  }
}