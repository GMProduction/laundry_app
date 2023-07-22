import 'package:flutter/material.dart';

import '../colors/genColors.dart';
import '../text/genText.dart';

class RoundedButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final Size width;
  final String text;
  final Function() ontap;

  const RoundedButton(
      {Key? key,
      this.bgColor = GenColors.primaryColor,
      this.textColor = Colors.black,
      this.width = const Size(88, 36),
      this.text = "",
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          minimumSize: width,
          padding: EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        onPressed: ontap,
        child: GenText(
          text,
          color: textColor,
          fontweight: FontWeight.bold,
        ));
  }
}
