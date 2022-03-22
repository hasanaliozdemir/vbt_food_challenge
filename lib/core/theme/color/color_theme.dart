import 'package:flutter/material.dart';

class AppColors {
  final Color green = const Color(0xff7bed8d);
  final Color mediumGrey = const Color(0xffa6bcd0);
  final Color mediumGreyBold = const Color(0xff748a9d);
  final Color lighterGrey = const Color(0xfff0f4f8);
  final Color lightGrey = const Color(0xffdbe2ed);
  final Color darkGrey = const Color(0xff4e5d6a);

  final Color white = const Color(0xffffffff);
  final Color pompelmo = const Color(0xffFD6666);
  final Color lunarbase = const Color(0xff868686);
  final Color black = const Color(0xff000000);
  final Color bleachedsilk = const Color(0xffF3F2F2);
  final Color nightblue = const Color(0xff6675FD);
  final Color redremains = const Color(0xffFFE0E0);
  final Color demonicyellow = const Color(0xffFFE600);
  final Color agedgrey = const Color(0xff7E7E7E);
  final Color lead = const Color(0xff212121);
  final Color darkerGrey = const Color(0xff404e5a);
}

abstract class IColors {
  AppColors get colors;
  Color? scaffoldBackgroundColor;
  Color? appBarColor;
  Color? tabBarColor;
  Color? tabbarSelectedColor;
  Color? tabbarNormalColor;
  Brightness? brightness;
  Color? buttonNormalColor;
  Color? buttonGoogleColor;

  ColorScheme? colorScheme;
}
