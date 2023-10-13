import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/constants/outline_btn.dart';
import 'package:homely_dish/views/ui/auth/login.dart';
import 'package:homely_dish/views/ui/auth/register.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Color(kOrange.value),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/onboading/vegetables.png',
                    width: 370,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Our food delivery app brings your favorite dishes to you.',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 28,
                  color: Color(kDarkGreen.value),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
              child: Container(
                decoration: BoxDecoration(
                  border: BorderDirectional(
                    start: BorderSide(width: 3.0, color: Color(kLight.value)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    'With our app, you will enjoy the ultimate home-made meals from our qualified chefs',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(kLight.value),
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlineButton(
                  onTap: () {
                    Get.to(() => const LoginPage());
                  },
                  text: 'Login',
                  tcolor: Color(kLight.value),
                  height: height * 0.06,
                  width: width * 0.4,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SignupPage());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(kSienna.value),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: width * 0.4,
                    height: height * 0.06,
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(kLight.value),
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
