import 'package:flutter/material.dart';

abstract class IColorTheme {
  Color? background;
  Color? buttonColor;
  Color? darkBackgorundColor; // color isimleri renge özgü
  Brightness? brightness;

  ColorScheme? colorScheme;
  AppColors? get colors;
}

class AppColors {
  final backgroundColor = const Color(0xff6E3BC6);
  final textColor = const Color(0xffE8813A);
  final yellowCardShadow = const Color(0xffF1D448);
  final notifiticonPink = const Color(0xffC763C2);
  final error = const Color(0xffFF0018);
  final redLight = const Color(0xffFD6666);
  final bluelight = const Color(0xff6675FD);
 
}