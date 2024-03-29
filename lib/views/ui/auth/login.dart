import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:homely_dish/api/api.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/constants/custom_btn.dart';
import 'package:homely_dish/constants/sign_in_btn.dart';
import 'package:homely_dish/controllers/login_provider.dart';
// import 'package:homely_dish/views/common/app_bar.dart';
import 'package:homely_dish/views/common/custom_textfield.dart';
import 'package:homely_dish/views/ui/auth/register.dart';
import 'package:homely_dish/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void initState() {
    super.initState();
  }

  void _login() async{
    final data = {
      'email' :emailController.text,
      'password' :passwordController.text,
    };
    final res = await CallApi().postData(data, 'login');
    final body = json.decode(res.body);
    // print(res.statusCode);
    if (res.statusCode ==200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      localStorage.setString('user', json.encode(body['user']));
      
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainScreen()));
    }
    else{
      print('Error occured');
    }
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
                      prefixIcon: const Icon(Icons.password_outlined),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // login button
                    CustomElevatedButton(
                      text: 'Login',
                      backGcolor: Color(kOrange2.value),
                      tcolor: Color(kDarkGreen.value),
                      onPressed: () {
                        _login();
                        // Get.to(() => const MainScreen());
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // go to register page
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          
                          Get.to(() => const SignupPage());
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(kDarkGrey.value),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
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
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'forgot password ?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(kDarkGrey.value),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
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
