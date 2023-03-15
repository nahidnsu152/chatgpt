import 'package:flutter/material.dart';

import '../utils/size_constant.dart';

class KListTile extends StatelessWidget {
  const KListTile({
    super.key,
    this.color,
    this.borderRadius,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
  });
  final Color? color;
  final BorderRadius? borderRadius;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? radius10,
      ),
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
      ),
    );
  }
}
