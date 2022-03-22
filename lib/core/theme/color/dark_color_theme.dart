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
    tabBarColor = colors.pompelmo;
    tabbarNormalColor = colors.lighterGrey;
    tabbarSelectedColor = colors.pompelmo;
    buttonNormalColor = colors.pompelmo;
    buttonGoogleColor = colors.nightblue;
    colorScheme = const ColorScheme.dark()
        .copyWith(onPrimary: colors.pompelmo, onSecondary: colors.darkGrey);
  }
}
