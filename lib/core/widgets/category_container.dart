// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTextContainerWidget extends StatefulWidget {
  final String text;
  final VoidCallback onpressed;

  CategoryTextContainerWidget({required this.text, required this.onpressed});

  @override
  _CategoryTextContainerWidgetState createState() =>
      _CategoryTextContainerWidgetState();
}

class _CategoryTextContainerWidgetState
    extends State<CategoryTextContainerWidget> {
  Color backColor = const Color.fromARGB(255, 255, 91, 91).withOpacity(0.4);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.only(left: 10, right: 10),
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width / 6,
        ),
        decoration: BoxDecoration(
            //color: backColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1)),
        child: GestureDetector(
          onTap: widget.onpressed,
          child: Center(
              child: Text(
            widget.text,
            style: GoogleFonts.poppins(
                fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
          )),
        ));
  }
}
