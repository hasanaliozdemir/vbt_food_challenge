
import 'package:flutter/material.dart';
import 'package:vbt_food_challange/core/theme/text/text_theme.dart';

import 'color/color_theme.dart';
import 'color/light_color_theme.dart';
import 'text/light_text_theme.dart';

abstract class ITheme {
  ITextTheme get textTheme;
  IColorTheme get colorTheme;
}

class AppThemeLight extends ITheme {
  @override
  IColorTheme colorTheme = LightTheme();

  @override
  ITextTheme get textTheme => LightTextTheme(colorTheme.colors?.backgroundColor);
}

abstract class ThemeManager {
  static ThemeData createTheme(ITheme theme) {
    return ThemeData(
        appBarTheme: AppBarTheme(
            color: theme.colorTheme.colors?.backgroundColor,
            titleTextStyle: theme.textTheme.body1
                ?.copyWith(color: theme.colorTheme.colorScheme?.onPrimary, fontWeight: FontWeight.bold)),
        fontFamily: theme.textTheme.fontFamily,
        textTheme: TextTheme(headline6: theme.textTheme.headline6, bodyText1: theme.textTheme.body1)
            .apply(bodyColor: theme.textTheme.primaryColor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: theme.colorTheme.colorScheme?.error),
        dividerTheme: DividerThemeData(color: theme.colorTheme.colors?.backgroundColor),
        buttonTheme:
            ButtonThemeData(colorScheme: ColorScheme.light(onTertiary: theme.colorTheme.background ?? Colors.black)),
        bottomAppBarTheme: BottomAppBarTheme(color: theme.colorTheme.buttonColor));
  }
}