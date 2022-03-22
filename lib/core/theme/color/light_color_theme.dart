import 'dart:ui';

import 'package:flutter/src/material/color_scheme.dart';

import 'color_theme.dart';

class LightTheme implements IColorTheme {
  @override
  final AppColors? colors = AppColors();

  @override
  late final Color? background;

  @override
  late final Brightness? brightness;

  @override
  late final ColorScheme? colorScheme;

  @override
  Color? buttonColor;

  LightTheme() {
    // backgroundColor = colors.whiteTheme;
    brightness = Brightness.light;
    // blackTextColor = colors.blackTheme;
    // blueTextColor = colors.darkBlue;
    colorScheme = const ColorScheme.light()
        .copyWith(background: colors?.yellowCardShadow, primary: colors?.error, onPrimary: colors?.notifiticonPink);
    background = colors?.backgroundColor;
  }

  @override
  Color? darkBackgorundColor;
}