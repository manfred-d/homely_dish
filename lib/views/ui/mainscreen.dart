import 'package:flutter/material.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/views/ui/bookmarks/bookmarksceen.dart';
import 'package:homely_dish/views/ui/cart/cart_screen.dart';
import 'package:homely_dish/views/ui/home/homescreen.dart';
import 'package:homely_dish/views/ui/search/searchscreen.dart';
// import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> page = <Widget>[
    const HomePage(),
    const SearchPage(),
    const BookmarkPage(),
    const CartPage()
  ];

  // on item tap
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: page.elementAt(_selectedIndex),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: Color(kSienna.value).withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: _selectedIndex,
            selectedItemColor: Color(kLight.value),
            unselectedItemColor: Color(kOrangeAccent.value),
            iconSize: 26,
            onTap: _onItemTap,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.shifting,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_max),
                label: 'Home',
                backgroundColor: Colors.transparent,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded),
                label: 'Search',
                backgroundColor: Colors.transparent,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline_rounded),
                label: 'Favorite',
                backgroundColor: Colors.transparent,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Cart',
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
