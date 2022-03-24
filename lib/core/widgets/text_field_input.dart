import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/theme/color/color_theme.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        enabledBorder: inputBorder,
        fillColor: AppColors().bleachedsilk,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors().red,
          ),
          borderRadius: context.normalBorderRadius,
        ),
      ),
      style: TextStyle(
        color: AppColors().black,
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
