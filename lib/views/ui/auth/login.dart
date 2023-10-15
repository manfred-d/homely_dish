import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/constants/custom_btn.dart';
import 'package:homely_dish/controllers/login_provider.dart';
// import 'package:homely_dish/views/common/app_bar.dart';
import 'package:homely_dish/views/common/custom_textfield.dart';
import 'package:homely_dish/views/ui/auth/register.dart';
import 'package:homely_dish/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(builder: (context, loginNotifier, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: PreferredSize(
        //   preferredSize: const Size.fromHeight(50),
        //   child: CustomAppBar(
        //     text: 'Login',
        //     child: GestureDetector(
        //       onTap: () {
        //         Get.back();
        //       },
        //       child: const Icon(CupertinoIcons.arrow_left),
        //     ),
        //   ),
        // ),
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
              top: 0,
              left: 0,
              width: width,
              height: height * 0.4,
              child: Container(
                width: width,
                decoration: BoxDecoration(color: Color(kOrange2.value)),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              width: width,
              height: height * 0.8,
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  color: Color(kDarkGreen.value),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Welcome Back!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: Color(kOrange.value),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Fill in the details to login to your account',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(kLightBlue.value),
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.01
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Enter your Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email!.isEmpty || !email.contains('@')) {
                          return 'Please provide a valid email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Enter your password',
                      keyboardType: TextInputType.text,
                      validator: (password) {
                        if (password!.isEmpty || password.length < 8) {
                          return 'Please provide password not less than 8 char';
                        } else {
                          return null;
                        }
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {
                          loginNotifier.obscureText =
                              !loginNotifier.obscureText;
                        },
                        child: Icon(
                          loginNotifier.obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(kDarkGreen.value),
                        ),
                      ),
                      obscureText: loginNotifier.obscureText,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomElevatedButton(
                      text: 'Login',
                      backGcolor: Color(kOrange2.value),
                      tcolor: Color(kDarkGreen.value),
                      onPressed: () {
                        Get.to(() => const MainScreen());
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const SignupPage());
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(kDark.value),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),

                    // Signing with Email / LinkedIn / Facebook
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
