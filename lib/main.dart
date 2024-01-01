import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homely_dish/constants/app_constants.dart';

import 'package:homely_dish/views/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';
// providers
import 'views/common/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnBoadingNotifier()),
        ChangeNotifierProvider(create: (context) => LoginNotifier()),
        ChangeNotifierProvider(create: (context) => RegisterNotifier()),
        ChangeNotifierProvider(create: (context) => ZoomNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,   
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Homely Dish',
          theme: ThemeData(
            scaffoldBackgroundColor: Color(kLightBlue.value),
            iconTheme: IconThemeData(color: Color(kDark.value)),
            primarySwatch: Colors.grey,
          ),
          home: const OnboardingScreen(),
        );
      },
    );
  }
}
