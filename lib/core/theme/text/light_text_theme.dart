import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vbt_food_challange/core/theme/text/text_theme.dart';

class LightTextTheme implements ITextTheme {
  @override
  TextStyle? body1;

  @override
  String? fontFamily;

  @override
  TextStyle? headline6;

  @override
  Color? primaryColor;

  LightTextTheme(this.primaryColor) {
    body1 = TextStyle(fontSize: 17);
    headline6 = TextStyle(fontSize: 21, fontWeight: FontWeight.w200);
    fontFamily = GoogleFonts.fredokaOne().fontFamily;
  }
}