import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/utils.dart';

class OnboardContent extends HookConsumerWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          height: 258.h,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        gap20,
        gap16,
        SizedBox(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: CustomStyle.customStyleInstance.onboardTitleStyle,
          ),
        ),
        gap20,
        Text(
          description,
          textAlign: TextAlign.center,
          style: CustomStyle.customStyleInstance.onboardDescriptionStyle,
        ),
      ],
    );
  }
}
