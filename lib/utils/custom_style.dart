import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dimensions.dart';
import 'text_theme_style_x.dart';

class CustomStyle {
  CustomStyle._();
  static final CustomStyle _customStyle = CustomStyle._();
  static get customStyleInstance => _customStyle;

  final textFieldStyle = TextStyle(
    fontSize: Dimensions.mediumTextSize,
    color: useContext().color.shadow,
  );

  //? HOme Screen
  final appbarTitleTextStyle = TextStyle(
    fontSize: Dimensions.textSize22,
    fontWeight: FontWeight.bold,
  );

  final selectModelTextStyle = TextStyle(
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.bold,
  );
  final senderTextStyle = TextStyle(
    fontSize: Dimensions.mediumTextSize,
    color: Colors.white,
  );
  final gptTextStyle = TextStyle(
    fontSize: Dimensions.mediumTextSize,
    color: Colors.black,
  );
}
