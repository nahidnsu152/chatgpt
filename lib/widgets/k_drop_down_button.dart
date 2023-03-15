import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/utils.dart';

class KDropDownButton extends HookConsumerWidget {
  const KDropDownButton({
    super.key,
    required this.list,
    required this.selectedValue,
    this.onChanged,
  });

  final ValueNotifier<List<String>> list;
  final ValueNotifier<int> selectedValue;
  final Function(String?)? onChanged;
  @override
  build(BuildContext context, WidgetRef ref) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        style: context.caption.copyWith(
          fontSize: 16.sp,
          color: context.theme.hintColor,
        ),
        value: list.value[selectedValue.value],
        hint: Text(
          "Please Select",
          style: context.caption.copyWith(
            fontSize: 16.sp,
            color: context.headline6.color,
          ),
        ),
        buttonStyleData: ButtonStyleData(
          elevation: 3,
          padding: paddingLeft16,
          decoration: BoxDecoration(
            borderRadius: radius8,
            border: Border.all(
              color: context.theme.shadowColor.withOpacity(.3),
            ),
          ),
        ),
        onChanged: onChanged,
        items: list.value.map(
          (e) {
            return DropdownMenuItem(
              value: e,
              child: Text(
                e.toString(),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
