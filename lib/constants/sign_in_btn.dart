import 'package:flutter/material.dart';
import 'package:homely_dish/constants/app_constants.dart';

class SocialBtn extends StatelessWidget {
  const SocialBtn({
    super.key,
    this.onTap,
    required this.bgcolor,
    required this.tcolor,
    required this.icon,
  });

  final void Function()? onTap;
  final Color bgcolor;
  final Color tcolor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.25,
        height: height * 0.06,
        color: bgcolor,
        child: Icon(
          icon,
          color: tcolor,
        ),
      ),
    );
  }
}
