import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets.dart';

class KCircleAvatar extends StatelessWidget {
  const KCircleAvatar({
    Key? key,
    required this.imgUrl,
    this.radius = 20,
    this.onTap,
    this.icon,
    this.enableBorder = true,
    this.bgColor,
  }) : super(key: key);

  final String imgUrl;
  final double radius;
  final bool enableBorder;
  final VoidCallback? onTap;
  final Widget? icon;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return KInkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.w),
      padding: EdgeInsets.all(4.w),
      child: CircleAvatar(
        radius: enableBorder ? radius + 1 : radius - 1,
        backgroundColor: bgColor ?? Theme.of(context).colorScheme.primary,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: bgColor ?? Theme.of(context).colorScheme.background,
          backgroundImage: imgUrl.isNotEmpty
              ? CachedNetworkImageProvider(
                  imgUrl,
                  errorListener: () => const Icon(Icons.error_outline_outlined),
                )
              : null,
          child: icon,
        ),
      ),
    );
  }
}
