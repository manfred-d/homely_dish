import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton(
      {super.key,
      this.width,
      this.height,
      required this.text,
      this.onTap,
      required this.tcolor,
      this.bcolor});

  final double? width;
  final double? height;
  final String text;
  final void Function()? onTap;
  final Color tcolor;
  final Color? bcolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bcolor,
          border: Border.all(width: 1, color: tcolor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: tcolor,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }
}
