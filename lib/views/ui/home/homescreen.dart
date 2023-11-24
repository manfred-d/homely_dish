import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/constants/reusable_text.dart';
import 'package:homely_dish/views/common/app_bar.dart';
import 'package:homely_dish/views/common/custom_heading.dart';
import 'package:homely_dish/views/common/item_page.dart';
import 'package:homely_dish/views/ui/cart/cart_screen.dart';
import 'package:homely_dish/views/ui/categories/categoryscreen.dart';
import 'package:homely_dish/views/ui/home/widgets/card_widget.dart';
import 'package:homely_dish/views/ui/home/widgets/categories_widget.dart';
import 'package:homely_dish/views/ui/profile/profile_screen.dart';

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
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const ProfilePage());
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                    'assets/images/onboading/logo.png',
                  ),
                ),
              ),
            ),
          ],
          text: 'Nairobi, Kenya',
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.location_on_outlined,
                size: 34,
                color: Color(kDarkGreen.value),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Card(
                  color: Color(kOrangeAccent.value),
                  elevation: 10,
                  shadowColor: Color(kDarkGrey.value),
                  child: Container(
                    height: height * 0.18,
                    width: width,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReusableText(
                                color: Color(kLight.value),
                                text: 'Todays Offer',
                                fontweigth: FontWeight.w300,
                                fontsize: 16,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ReusableText(
                                color: Color(kLight.value),
                                text: 'Chicken Deals',
                                fontweigth: FontWeight.w600,
                                fontsize: 20,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: width * 0.3,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: Color(kSienna.value),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(() => const CartPage());
                                  },
                                  child: Center(
                                    child: Text(
                                      'Order',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(kLightBlue.value)),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Center(
                            child: Image(
                              width: 130,
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/onboading/vegetables.png',
                              ),
                            ),
                          )
                        ],
                      ),
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
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MealCardWidget(
                          onTap: () {
                            Get.to(() => const ItemScreen());
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
