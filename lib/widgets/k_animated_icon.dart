import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KAnimatedIcon extends HookConsumerWidget {
  const KAnimatedIcon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currIndex = useState(true);
    return IconButton(
      icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, anim) => RotationTransition(
                turns: child.key == const ValueKey('icon1')
                    ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                    : Tween<double>(begin: 0.75, end: 1).animate(anim),
                child: FadeTransition(opacity: anim, child: child),
              ),
          child: currIndex.value == true
              ? const Icon(EvaIcons.arrowDown, key: ValueKey('icon1'))
              : const Icon(
                  EvaIcons.arrowDownOutline,
                  key: ValueKey('icon2'),
                )),
      onPressed: () {
        currIndex.value = !currIndex.value;
      },
    );
  }
}
