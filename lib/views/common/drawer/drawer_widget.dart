import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/controllers/zoom_provider.dart';
import 'package:homely_dish/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>(builder: (context, zoomNotifier, child) {
      return IconButton(
        onPressed: () {
          final zoomDrawer = ZoomDrawer.of(context);
          if (zoomDrawer != null) {
            zoomDrawer.toggle();
          } else {
            Get.to(() => const MainScreen());
          }
        },
        icon: Icon(
          Icons.menu_rounded,
          size: 30.w,
          color: Color(kDarkGreen.value),
        ),
        // SvgPictur.asset('assets/icons/menu.svg', width: 30.w, height: 30.h),
      );
    });
  }
}
