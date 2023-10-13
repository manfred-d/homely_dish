import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/constants/reusable_text.dart';
import 'package:homely_dish/views/common/app_bar.dart';
import 'package:homely_dish/views/common/custom_heading.dart';
import 'package:homely_dish/views/common/drawer/drawer_widget.dart';
import 'package:homely_dish/views/ui/cart/cartscreen.dart';
import 'package:homely_dish/views/ui/categories/categoryscreen.dart';
import 'package:homely_dish/views/ui/home/widgets/card_widget.dart';
import 'package:homely_dish/views/ui/home/widgets/categories_widget.dart';

// Home page. index 0
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SearchController searchController = SearchController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
          text: 'Nairobi, Kenya',
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: DrawerWidget(),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                ReusableText(
                  color: Color(kDarkGreen.value),
                  text: 'Search, \nFind & Order',
                  fontweigth: FontWeight.bold,
                  fontsize: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(kDark.value).withOpacity(0.6),
                  ),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.search_rounded,
                        color: Color(kLight.value),
                        size: 25.h,
                      ),
                      hintText: 'Search your favorite meal',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color(kLight.value),
                        fontWeight: FontWeight.normal,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(kLight.value),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                HeadingWidget(
                  heading: "Categories",
                  onTap: () {
                    Get.to(() => const CategoryPage());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: height * 0.15,
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoriesWidget(
                        onTap: () {},
                        backgroundImage: 'assets/images/onboading/logo.png',
                        text: 'Humbergers',
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                HeadingWidget(
                  heading: "Popular Meals",
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: width,
                  height: height,
                  child: ListView.builder(
                    itemCount: 5,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: MealCardWidget(
                          onTap: () {
                            Get.to(() => const CartPage());
                          },
                          image: const AssetImage(
                            'assets/images/onboading/vegetables.png',
                          ),
                          title: 'Chicken & Rice',
                          price: 680.00,
                        ),
                      );
                    },
                  ),
                ),
                // const Column(
                //   children: [
                //     MealCardWidget(),
                //     MealCardWidget(),
                //     MealCardWidget(),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
