import 'package:flutter/material.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/constants/reusable_text.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    this.onTap,
    required this.backgroundImage,
    required this.text,
  });

  final void Function()? onTap;
  final String backgroundImage;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.24,
      height: height * 0.12,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(backgroundImage),
              radius: 30,
            ),
            const SizedBox(
              height: 5,
            ),
            ReusableText(
              color: Color(kDarkGreen.value),
              text: text,
              fontweigth: FontWeight.w500,
              fontsize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
