import 'package:flutter/material.dart';

import '../../core/theme/color/color_theme.dart';

class MyFAB extends StatelessWidget {
  const MyFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, "/addFoodPage");
      },
      child: Center(
          child: const Padding(
        padding: EdgeInsets.all(1.0),
        child: Text(
          "Tarif Ekle",
          style: const TextStyle(
              fontSize: 9, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )),
      backgroundColor: AppColors().red,
    );
  }
}
