import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTextContainerWidget extends StatefulWidget {
  final String text;
  final VoidCallback? onpressed;

  CategoryTextContainerWidget(this.text, this.onpressed);

  @override
  _CategoryTextContainerWidgetState createState() => _CategoryTextContainerWidgetState();
}

class _CategoryTextContainerWidgetState extends State<CategoryTextContainerWidget> {
  Color backColor = const Color.fromARGB(255, 255, 91, 91).withOpacity(0.4);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width / 6,
      ),
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: widget.onpressed,
        child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: backColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
                child: Text(
              widget.text,
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ))),
      ),
    );
  }
}
