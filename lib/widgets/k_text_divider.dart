import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../utils/text_theme_style_x.dart';

class KTextDivider extends HookConsumerWidget {
  const KTextDivider({
    super.key,
    this.padding = EdgeInsets.zero,
    required this.text,
  });

  final EdgeInsetsGeometry padding;
  final String text;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Expanded(
              child: Divider(
            endIndent: 12,
            thickness: 1.1,
          )),
          Text(
            text,
            style: context.caption.copyWith(fontWeight: FontWeight.normal),
          ),
          const Expanded(
              child: Divider(
            indent: 12,
            thickness: 1.1,
          ))
        ],
      ),
    );
  }
}
