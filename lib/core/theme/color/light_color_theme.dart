import 'package:flutter/material.dart';
import 'package:vbt_food_challange/core/theme/color/color_theme.dart';

class LightColors implements IColors {
  @override
  Color? appBarColor;

  @override
  Brightness? brightness;

  @override
  ColorScheme? colorScheme;

  @override
  Color? scaffoldBackgroundColor;

  @override
  Color? tabBarColor;

  @override
  Color? tabbarNormalColor;

  @override
  Color? tabbarSelectedColor;

  @override
  final AppColors colors = AppColors();

  LightColors() {
    appBarColor = colors.white;
    scaffoldBackgroundColor = colors.white;
    tabBarColor = colors.red;
    tabbarNormalColor = colors.darkerGrey;
    tabbarSelectedColor = colors.red;

    buttonNormalColor = colors.red;
    buttonGoogleColor = colors.nightblue;
    colorScheme = const ColorScheme.light().copyWith(
      onPrimary: colors.red, //xx Her ikisinde ortaktır
      onSecondary: colors.white,
      onSurface: colors.mediumGreyBold,
    );
  }

  @override
  Color? buttonGoogleColor;

  @override
  Color? buttonNormalColor;
}
