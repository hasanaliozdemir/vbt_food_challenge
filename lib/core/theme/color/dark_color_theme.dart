import 'package:flutter/material.dart';

import 'color_theme.dart';

class DarkColors implements IColors {
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
  Color? buttonGoogleColor;

  @override
  Color? buttonNormalColor;

  @override
  final AppColors colors = AppColors();

  DarkColors() {
    appBarColor = colors.lead;
    scaffoldBackgroundColor = colors.lead;
    tabBarColor = colors.red;
    tabbarNormalColor = colors.lighterGrey;
    tabbarSelectedColor = colors.red;
    buttonNormalColor = colors.red;
    buttonGoogleColor = colors.nightblue;
    colorScheme = const ColorScheme.dark()
        .copyWith(onPrimary: colors.red, onSecondary: colors.darkGrey);
  }
}
