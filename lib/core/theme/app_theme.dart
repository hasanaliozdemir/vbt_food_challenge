import 'package:flutter/material.dart';
import 'package:vbt_food_challange/core/theme/color/color_theme.dart';
import 'package:vbt_food_challange/core/theme/color/dark_color_theme.dart';
import 'package:vbt_food_challange/core/theme/text/dark_text_theme.dart';
import 'package:vbt_food_challange/core/theme/text/light_text_theme.dart';
import 'package:vbt_food_challange/core/theme/text/text_theme.dart';

import 'color/light_color_theme.dart';

abstract class ITheme {
  ITextTheme get textTheme;
  IColors get colors;
}

abstract class ThemeManager {
  static ThemeData createTheme(ITheme theme) => ThemeData(
        fontFamily: theme.textTheme.fontFamily,
        textTheme: theme.textTheme.data,
        cardColor: theme.colors.colorScheme?.onSecondary,
        bottomAppBarColor: theme.colors.scaffoldBackgroundColor,
        tabBarTheme: TabBarTheme(
          indicator: const BoxDecoration(),
          labelColor: theme.colors.tabbarSelectedColor,
          unselectedLabelColor: theme.colors.tabbarNormalColor,
        ),
        appBarTheme: AppBarTheme(backgroundColor: theme.colors.appBarColor),
        scaffoldBackgroundColor: theme.colors.scaffoldBackgroundColor,
        colorScheme: theme.colors.colorScheme,
      );
}

class AppThemeDark extends ITheme {
  @override
  late final ITextTheme textTheme;
  AppThemeDark() {
    textTheme = TextThemeDark(colors.colors.mediumGrey);
  }

  @override
  IColors get colors => DarkColors();
}

class AppThemeLight extends ITheme {
  @override
  late final ITextTheme textTheme;
  AppThemeLight() {
    textTheme = TextThemeLight(colors.colors.mediumGrey);
  }

  @override
  IColors get colors => LightColors();
}
