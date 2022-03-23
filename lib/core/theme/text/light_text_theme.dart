import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vbt_food_challange/core/theme/text/text_theme.dart';

class TextThemeLight implements ITextTheme {
  @override
  TextStyle? bodyText1;

  @override
  TextStyle? bodyText2;

  @override
  late final TextTheme data;

  @override
  String? fontFamily;

  @override
  TextStyle? headline1;

  @override
  TextStyle? headline3;

  @override
  TextStyle? headline4;

  @override
  TextStyle? headline5;

  @override
  TextStyle? headline6;

  @override
  TextStyle? subtitle1;

  @override
  TextStyle? subtitle2;

  @override
  Color? primaryColor;

  @override
  TextStyle? caption;

  TextThemeLight(this.primaryColor) {
    data = const TextTheme(
      headline6: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      subtitle1: TextStyle(fontSize: 16.0),
      headline4: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      caption: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      headline5: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      subtitle2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
    ).apply(bodyColor: primaryColor);
    fontFamily = GoogleFonts.poppins().fontFamily;
  }
}
