import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/constants/custom_btn.dart';
import 'package:homely_dish/constants/sign_in_btn.dart';
import 'package:homely_dish/controllers/register_provider.dart';
import 'package:homely_dish/views/common/custom_textfield.dart';
import 'package:homely_dish/views/ui/auth/login.dart';
import 'package:homely_dish/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController fnameController = TextEditingController();

  @override
  void dispose() {
    fnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterNotifier>(
        builder: (context, registerNotifier, child) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              width: width,
              height: height * 0.3,
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
                width: double.infinity,
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
                      height: 30,
                    ),
                    Text(
                      'Hello, Welcome',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: Color(kLightBlue.value),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Fill in the details to create your account',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(kLightBlue.value),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      controller: fnameController,
                      hintText: 'Enter your full names',
                      keyboardType: TextInputType.text,
                      validator: (fname) {
                        if (fname!.isEmpty) {
                          return 'Please provide names';
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: const Icon(Icons.person_2_outlined),
                    ),
                    const SizedBox(
                      height: 20,
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
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Enter your password',
                      keyboardType: TextInputType.text,
                      validator: (password) {
                        if (registerNotifier
                            .passwordValidator(password ?? '')) {
                          return "Please enter a valid password with at least 8 characters, one lowercase,one uppercase and special character";
                        }
                        return null;
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {
                          registerNotifier.obscureText =
                              !registerNotifier.obscureText;
                        },
                        child: Icon(
                          registerNotifier.obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(kDarkGreen.value),
                        ),
                      ),
                      obscureText: registerNotifier.obscureText,
                      prefixIcon: const Icon(Icons.password_rounded),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomElevatedButton(
                      text: 'Register',
                      backGcolor: Color(kSienna.value),
                      tcolor: Color(kLightBlue.value),
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
                          Get.to(() => const LoginPage());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(kLightBlue.value),
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 10,
                      color: Color(kLightGrey.value),
                      thickness: 1.12,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Signing with Email / LinkedIn / Facebook
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SocialBtn(
                          bgcolor: Colors.lightBlue,
                          tcolor: Color(kLight.value),
                          icon: Icons.facebook,
                        ),
                        SocialBtn(
                          bgcolor: Color(kOrange2.value),
                          tcolor: Color(kDarkGreen.value),
                          icon: Ionicons.logo_google,
                        ),
                        SocialBtn(
                          bgcolor: Colors.blue,
                          tcolor: Color(kLight.value),
                          icon: Ionicons.logo_twitter,
                        ),
                      ],
                    ),
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
