import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

kShowBottomSheet({
  required BuildContext context,
  required Widget child,
}) {
  return showModalBottomSheet(
    // expand: false,
    context: context,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    builder: (context) => Container(
      // height: height,
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: IntrinsicHeight(child: child),
    ),
  );
}
