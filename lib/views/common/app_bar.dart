import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homely_dish/constants/app_constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.text,
    required this.child,
    this.actions,
    this.bcolor = const Color(0xFFCCD7DE),
  });

  final String? text;
  final Widget child;
  final List<Widget>? actions;
  final Color? bcolor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: bcolor,
      title: Text(
        text ?? "",
        style: TextStyle(
            color: Color(kDark.value),
            fontWeight: FontWeight.w600,
            fontSize: 16),
      ),
      iconTheme: const IconThemeData(),
      automaticallyImplyLeading: false,
      leadingWidth: 70.w,
      leading: child,
      actions: actions,
      toolbarHeight: 100.h,
      centerTitle: true,
    );
  }
}
