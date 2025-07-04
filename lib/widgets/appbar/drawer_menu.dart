import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/appbar/my_app_bar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drawer_menu.g.dart';

class DrawerMenu extends ConsumerStatefulWidget {
  const DrawerMenu({super.key});

  @override
  ConsumerState<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ConsumerState<DrawerMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 500),
    reverseDuration: const Duration(milliseconds: 500),
  );
  late final _animation = Tween<Offset>(
    begin: Offset(0, -1),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInExpo));

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(drawerMenuControllerProvider, (previous, next) {
      if (next.value == true) {
        controller.forward();
      } else {
        controller.reverse(from: 1000);
      }
    });
    return ClipRect(
      child: SlideTransition(
        position: _animation,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surfaceDim,
            boxShadow: [
              BoxShadow(
                color: context.theme.colorScheme.surface.withAlpha(90),
                blurRadius: 6,
                spreadRadius: 3,
              ),
            ],
          ),
          child: MenuList(wrapper: (children) => Column(children: children)),
        ),
      ),
    );
  }
}

@riverpod
class DrawerMenuController extends _$DrawerMenuController {
  @override
  FutureOr<bool> build() {
    return false;
  }

  void toggle() {
    update((state) => !state);
  }
}