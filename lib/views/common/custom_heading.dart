import 'package:flutter/material.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/constants/reusable_text.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({super.key, this.onTap, required this.heading});
  final void Function()? onTap;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ReusableText(
          color: Color(kDarkGreen.value),
          text: heading,
          fontweigth: FontWeight.w600,
          fontsize: 20,
        ),
        GestureDetector(
          onTap: onTap,
          child: ReusableText(
            color: Color(kOrange.value),
            text: 'View all',
            fontweigth: FontWeight.w500,
            fontsize: 18,
          ),
        ),
      ],
    );
  }
}
