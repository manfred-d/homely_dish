import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/constants/outline_btn.dart';
import 'package:homely_dish/views/ui/auth/login.dart';
import 'package:homely_dish/views/ui/auth/register.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

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
                    'assets/images/onboading/vegetables_thrown_from_sufuria.png',
                    width: width * 0.8,
                    height: height * 0.5,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Grab your delicious meals .',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 30,
                  color: Color(kDark.value).withOpacity(0.6),
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Delivery food in your App .',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(kDarkGreen.value),
                  fontWeight: FontWeight.normal,
                  letterSpacing: 4,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
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
                            color: Color(kLightBlue.value),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
