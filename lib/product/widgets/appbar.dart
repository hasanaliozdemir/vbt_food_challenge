import 'package:flutter/material.dart';

PreferredSizeWidget header({
  required BuildContext context,
  required String name,
  required bool isback,
}) {
  TextStyle appTitleTextStyle = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  return PreferredSize(
    preferredSize: const Size.fromHeight(69),
    child: AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      title: Text(
        name,
        style: appTitleTextStyle,
      ),
      actionsIconTheme:
          const IconThemeData(size: 30.0, color: Colors.white, opacity: 10.0),
      leading: isback
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
    ),
  );
}
