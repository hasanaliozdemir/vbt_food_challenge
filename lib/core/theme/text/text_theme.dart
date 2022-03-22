import 'package:flutter/rendering.dart';

abstract class ITextTheme {
  TextStyle? headline6;
  TextStyle? body1;
  String? fontFamily;
  final Color? primaryColor;

  ITextTheme(this.primaryColor);
}