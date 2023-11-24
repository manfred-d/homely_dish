import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/constants/custom_btn.dart';
import 'package:homely_dish/constants/reusable_text.dart';
import 'package:homely_dish/controllers/zoom_provider.dart';
import 'package:homely_dish/views/ui/cart/cart_screen.dart';
import 'package:provider/provider.dart';
// import 'package:homely_dish/views/common/app_bar.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>(builder: (context, zoomNotifier, child) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 171, 64, 1),
        resizeToAvoidBottomInset: false,
        // appBar: PreferredSize(
        //   preferredSize: const Size.fromHeight(60.0),
        //   child: CustomAppBar(
        //     bcolor: Colors.transparent,
        //     child: Padding(
        //       padding: EdgeInsets.all(12.h),
        //       child: IconButton(
        //         onPressed: () {
        //           Get.back();
        //         },
        //         icon: const Icon(Ionicons.arrow_back),
        //       ),
        //     ),
        //   ),
        // ),
        body: Stack(
          children: [
            Positioned(
              top: 60,
              left: 10,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                color: Color(kDarkGreen.value),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 50,
              width: width * 0.75,
              height: height * 0.39,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: Image.asset(
                  'assets/images/onboading/vegetables_thrown_from_sufuria.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              width: width,
              height: height * 0.55,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF009F45),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ReusableText(
                            color: Color(kLight.value),
                            text: 'Ksh: 250',
                            fontweigth: FontWeight.w700,
                            fontsize: 22,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ReusableText(
                            color: Color(kLight.value),
                            text: 'Beef Burger',
                            fontweigth: FontWeight.w500,
                            fontsize: 22,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          ReusableText(
                            color: Color(kLight.value),
                            text:
                                'Big Juicy beef burger with cheezs, tomatoes, onions and special sauce!',
                            fontweigth: FontWeight.normal,
                            fontsize: 18,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ReusableText(
                          color: Color(kLight.value),
                          text: 'Add One',
                          fontweigth: FontWeight.bold,
                          fontsize: 20,
                        ),
                      ),
                      Row(
                        children: [
                          Card(
                            shadowColor: Color(kDarkGreen.value),
                            color: Color(kLightBlue.value),
                            elevation: 10,
                            margin: const EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 10,
                            ),
                            child: SizedBox(
                              height: 80.h,
                              width: 80.w,
                              child: Image.asset(
                                'assets/images/onboading/logo.png',
                              ),
                            ),
                          ),
                          Card(
                            shadowColor: Color(kDarkGreen.value),
                            color: Color(kLightBlue.value),
                            elevation: 10,
                            margin: const EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 10.0,
                            ),
                            child: SizedBox(
                              height: 80.h,
                              width: 80.w,
                              child: Image.asset(
                                'assets/images/onboading/logo.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: width,
                        child: CustomElevatedButton(
                          text: 'Add to Cart',
                          backGcolor: Color(kOrangeAccent.value),
                          tcolor: Color(kDarkGreen.value),
                          onPressed: () {
                            Get.to(() => const CartPage());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
