import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class KReadMoreText extends StatelessWidget {
  const KReadMoreText(
    this.aboutMe, {
    Key? key,
    this.style,
    this.trimLength = 120,
  }) : super(key: key);

  final String aboutMe;
  final TextStyle? style;
  final int trimLength;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      aboutMe,
      style: style ??
          Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                letterSpacing: 1.1.w,
              ),
      trimLength: trimLength,
      trimCollapsedText: '...read more',
      trimExpandedText: 'read less',
      colorClickableText: Theme.of(context).colorScheme.error,
    );
  }
}
