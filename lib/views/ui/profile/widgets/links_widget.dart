import 'package:flutter/material.dart';
import 'package:homely_dish/constants/reusable_text.dart';

class TabsWidget extends StatelessWidget {
  const TabsWidget(
      {super.key,
      required this.icon,
      required this.tcolor,
      required this.icolor,
      required this.text,
      this.onTap});

  final IconData icon;
  final Color tcolor;
  final Color icolor;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: icolor,
            ),
            const SizedBox(
              width: 20,
            ),
            ReusableText(
              color: tcolor,
              text: text,
              fontweigth: FontWeight.normal,
              fontsize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
