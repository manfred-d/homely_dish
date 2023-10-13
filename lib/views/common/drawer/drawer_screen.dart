import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
// import 'package:get/get.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/controllers/zoom_provider.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatefulWidget {
  final ValueSetter indexSetter;
  const DrawerScreen({super.key, required this.indexSetter});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>(builder: (context, zoomNotifier, child) {
      return GestureDetector(
        onDoubleTap: () {
          ZoomDrawer.of(context)!.toggle();
        },
        child: Scaffold(
          backgroundColor: Color(kLightBlue.value),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              drawerItem(
                AntDesign.home,
                "Home",
                0, //index
              ),
              // page 2
              drawerItem(
                Ionicons.bookmarks_outline,
                "Categories",
                1, //index
              ),
              // page 3
              drawerItem(
                Ionicons.search_outline,
                "Search",
                2, //index
              ),
              // page 4
              drawerItem(
                Ionicons.bookmark_outline,
                "Bookmarks",
                3, //index
              ),
              // page 5
              drawerItem(
                Ionicons.cart_outline,
                "Cart",
                4, //index
              ),
              // page 6
              drawerItem(
                AntDesign.user,
                "Profile",
                5, //index
              ),
              // index 7
              drawerItem(
                Ionicons.cart_outline,
                "Logout",
                6, //index
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget drawerItem(IconData icon, String text, int index) {
    return Consumer<ZoomNotifier>(
      builder: (context, zoomNotifier, child) {
        return GestureDetector(
          onTap: () {
            widget.indexSetter(index);
            ZoomDrawer.of(context)!.close();
          },
          child: Container(
            margin: EdgeInsets.only(left: 20.w, bottom: 20.h),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 25.w,
                  color: zoomNotifier.currentIndex == index
                      ? Color(kLight.value)
                      : Color(
                          kDarkGreen.value,
                        ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 15,
                    color: zoomNotifier.currentIndex == index
                        ? Color(kLight.value)
                        : Color(
                            kDarkGreen.value,
                          ),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
