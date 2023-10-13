import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/constants/custom_btn.dart';
import 'package:homely_dish/controllers/register_provider.dart';
import 'package:homely_dish/views/common/app_bar.dart';
import 'package:homely_dish/views/common/custom_textfield.dart';
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
  TextEditingController lnameController = TextEditingController();
  TextEditingController fnameController = TextEditingController();

  @override
  void dispose() {
    lnameController.dispose();
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
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            text: 'Register',
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(CupertinoIcons.arrow_left),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'Hello, Welcome Home',
                style: TextStyle(
                  fontSize: 28,
                  color: Color(kDarkGreen.value),
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
                  color: Color(kDarkGrey.value),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                controller: fnameController,
                hintText: 'Enter your first Name',
                keyboardType: TextInputType.text,
                validator: (fname) {
                  if (fname!.isEmpty) {
                    return 'Please provide first name';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: lnameController,
                hintText: 'Enter your last Name',
                keyboardType: TextInputType.text,
                validator: (lname) {
                  if (lname!.isEmpty) {
                    return 'Please provide last name';
                  } else {
                    return null;
                  }
                },
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
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                keyboardType: TextInputType.text,
                validator: (password) {
                  if (registerNotifier.passwordValidator(password ?? '')) {
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
              ),
              const SizedBox(
                height: 20,
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
                    Get.to(() => const SignupPage());
                  },
                  child: Text(
                    'Login',
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
      );
    });
  }
}
