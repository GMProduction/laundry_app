import 'package:flutter/material.dart';

class GenText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontweight;
  final double fontSize;
  final Color backgroundColor;
  final TextAlign textAlign;

  GenText(this.text,
      {Key? key,
      this.color = Colors.black,
      this.fontweight = FontWeight.normal,
      this.fontSize = 14,
      this.backgroundColor = Colors.transparent,
      this.textAlign = TextAlign.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontWeight: fontweight,
          fontSize: fontSize,
          backgroundColor: backgroundColor),
    );
  }
}
