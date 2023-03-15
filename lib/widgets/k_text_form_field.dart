import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../utils/text_theme_style_x.dart';


import '../utils/size_constant.dart';
import 'k_inkwell.dart';

class KTextFormField extends HookConsumerWidget {
  const KTextFormField({
    Key? key,
    required this.hintText,
    required TextEditingController controller,
    this.isObscure = false,
    this.readOnly = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor = Colors.transparent,
    this.fillColor,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.onSaved,
    this.onTap,
    this.textInputAction,
  })  : _controller = controller,
        super(key: key);

  final String hintText;
  final TextEditingController _controller;
  final bool isObscure, readOnly;
  final FocusNode? focusNode;
  final BorderRadius borderRadius;
  final Widget? prefixIcon, suffixIcon;
  final Color? fillColor;
  final Color borderColor;
  final TextInputType keyboardType;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final Function()? onEditingComplete, onTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context, ref) {
    final hideText = useState(true);

    final border = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: borderColor),
    );
    return TextFormField(
      controller: _controller,
      keyboardType: keyboardType,
      validator: validator,
      readOnly: readOnly,
      style: GoogleFonts.josefinSans(
        fontWeight: FontWeight.w500,
        // fontSize: 16.sp,
      ),
      obscureText: isObscure ? hideText.value : false,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: onSaved,
      onTap: onTap,
      decoration: InputDecoration(
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        errorBorder: border,
        disabledBorder: border,
        isDense: true,
        filled: true,
        fillColor: fillColor,
        // contentPadding: EdgeInsets.symmetric(
        //   horizontal: 12.w,
        //   vertical: 12.h,
        // ),
        hintText: hintText,
        prefixIcon: prefixIcon,
        // suffix: suffixIcon,
        suffixIcon: suffixIcon ??
            (isObscure
                ? KInkWell(
                    borderRadius: radius12,
                    onTap: () {
                      hideText.value = !hideText.value;
                    },
                    child: hideText.value
                        ? Icon(
                            Icons.remove_red_eye,
                            size: 20.sp,
                            color: Theme.of(context).primaryColorLight,
                          )
                        : Icon(
                            Icons.remove_red_eye_outlined,
                            size: 20.sp,
                          ),
                  )
                : null),
      ),
    );
  }
}

class KTextFormField2 extends HookConsumerWidget {
  const KTextFormField2({
    Key? key,
    this.controller,
    required this.hintText,
    this.textAlign = TextAlign.start,
    this.icon,
    this.readOnly = false,
    this.isLabel = false,
    this.onTap,
    this.prefix,
    this.validator,
    this.focusNode,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.textInputAction,
    this.maxLines = 1,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 12),
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final TextAlign textAlign;
  final Widget? icon;
  final bool readOnly, isLabel;
  final VoidCallback? onTap;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final bool isObscure;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final int? maxLines;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideText = useState(true);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: context.color.onBackground.withOpacity(.1),
        width: 2,
      ),
    );
    return TextFormField(
      obscureText: isObscure ? hideText.value : false,
      controller: controller,
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: GoogleFonts.josefinSans(
        fontWeight: FontWeight.w500,
        // fontSize: 16.sp,
      ),
      textAlign: textAlign,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: isLabel ? null : hintText,
        labelText: isLabel ? hintText : null,
        contentPadding: contentPadding,
        // fillColor: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
        border: border,
        enabledBorder: border,
        filled: true,
        prefix: prefix,
        suffixIcon: isObscure
            ? KInkWell(
                borderRadius: radius24,
                onTap: () {
                  hideText.value = !hideText.value;
                },
                child: hideText.value
                    ? const Icon(EvaIcons.eyeOff2Outline)
                    : const Icon(EvaIcons.eye),
              )
            : null,
      ),
      onTap: onTap,
      validator: validator,
    );
  }
}
