import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/theme/color/color_theme.dart';

class AuthTextField extends StatefulWidget {
  AuthTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.node,
    required this.changeObscureCallBack,
    this.isObsecure,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final FocusNode node;
  bool? isObsecure;
  final VoidCallback changeObscureCallBack;
  final String? Function(String?)? validator;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: context.width / 25,
          right: context.width / 25,
          bottom: context.height / 100,
          top: context.height / 100),
      child: TextFormField(
        focusNode: widget.node,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          fillColor: AppColors().bleachedsilk,
          border: OutlineInputBorder(
            borderSide: Divider.createBorderSide(context),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors().red,
            ),
            borderRadius: context.normalBorderRadius,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: Divider.createBorderSide(context),
          ),
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodyText2,
          suffixIcon: widget.hintText == "Password"
              ? widget.isObsecure! && widget.isObsecure != null
                  ? IconButton(
                      onPressed: changeObsecure,
                      icon: const Icon(Icons.visibility_off_rounded),
                    )
                  : IconButton(
                      onPressed: changeObsecure,
                      icon: const Icon(Icons.visibility),
                    )
              : const SizedBox(),
        ),
        obscureText: widget.isObsecure ?? false,
      ),
    );
  }

  void changeObsecure() {
    setState(() {
      widget.isObsecure = !(widget.isObsecure ?? false);
    });
  }
}
