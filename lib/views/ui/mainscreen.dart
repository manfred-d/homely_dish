import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/controllers/zoom_provider.dart';
import 'package:homely_dish/views/common/drawer/drawer_screen.dart';
import 'package:homely_dish/views/ui/bookmarks/bookmarksceen.dart';
import 'package:homely_dish/views/ui/cart/cart_screen.dart';
import 'package:homely_dish/views/ui/categories/categoryscreen.dart';
import 'package:homely_dish/views/ui/profile/profile_screen.dart';
import 'package:homely_dish/views/ui/search/searchscreen.dart';
import 'package:homely_dish/views/ui/home/homescreen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ZoomDrawerController _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>(builder: (context, zoomNotifier, child) {
      return ZoomDrawer(
        mainScreen: currentScreen(),
        menuScreen: DrawerScreen(indexSetter: (index) {
          zoomNotifier.currentIndex = index;
        }),
        controller: _drawerController,
        borderRadius: 30,
        showShadow: true,
        angle: -5.0,
        slideWidth: 210,
        menuBackgroundColor: Color(kLightBlue.value),
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.decelerate,
      );
    });
  }

  Widget currentScreen() {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    switch (zoomNotifier.currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const CategoryPage();
      case 2:
        return const SearchPage();
      case 3:
        return const BookmarkPage();
      case 4:
        return const CartPage();
      case 5:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }
}
