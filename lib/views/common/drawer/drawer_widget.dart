import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:homely_dish/constants/app_constants.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});
  final zoomDrawer = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final zoomDrawer = ZoomDrawer.of(context);
        if (zoomDrawer != null) {
          zoomDrawer.toggle();
        } else {
          print('null');
        }
      },
      icon: Icon(
        Icons.menu_rounded,
        size: 30.w,
        color: Color(kDarkGreen.value),
      ),
      // SvgPictur.asset('assets/icons/menu.svg', width: 30.w, height: 30.h),
    );
  }
}
