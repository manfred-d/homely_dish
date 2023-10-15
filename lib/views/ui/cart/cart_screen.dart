import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homely_dish/views/common/app_bar.dart';
import 'package:homely_dish/views/common/drawer/drawer_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: CustomAppBar(
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  'assets/images/onboading/logo.png',
                ),
              ),
            ),
          ],
          text: 'Cart',
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: DrawerWidget(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 1,
          backgroundColor: Colors.green,
          currentIndex: 1,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.card_travel),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_travel),
              label: 'Cart',
            ),
          ]),
    );
  }
}
