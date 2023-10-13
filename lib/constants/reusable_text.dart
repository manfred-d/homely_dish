import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  const ReusableText({
    super.key,
    required this.color,
    required this.text,
    required this.fontweigth,
    required this.fontsize,
  });

  final Color color;
  final String text;
  final FontWeight fontweigth;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        color: color,
        fontWeight: fontweigth,
      ),
    );
  }
}
