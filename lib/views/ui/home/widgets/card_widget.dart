import 'package:flutter/material.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/constants/reusable_text.dart';

class MealCardWidget extends StatelessWidget {
  const MealCardWidget(
      {super.key,
      this.onTap,
      required this.image,
      required this.title,
      this.text,
      required this.price});

  final void Function()? onTap;
  final ImageProvider image;
  final String title;
  final String? text;
  final double price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height * 0.18,
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 15.0,
        ),
        decoration: BoxDecoration(
          color: Color(kDarkGrey.value),
          borderRadius: BorderRadius.circular(15),
          // boxShadow: const BoxShadow(spreadRadius: 2,blurRadius: 10,),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: image),
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(
                    color: Color(kDarkGreen.value),
                    text: title,
                    fontweigth: FontWeight.bold,
                    fontsize: 24,
                  ),
                  ReusableText(
                    color: Color(kOrange.value),
                    text: text ?? '',
                    fontweigth: FontWeight.w400,
                    fontsize: 16,
                  ),
                  ReusableText(
                    color: Color(kDarkGreen.value),
                    text: 'Ksh: $price',
                    fontweigth: FontWeight.w600,
                    fontsize: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
