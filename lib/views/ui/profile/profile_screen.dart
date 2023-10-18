import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/constants/reusable_text.dart';
import 'package:homely_dish/views/common/app_bar.dart';
import 'package:homely_dish/views/common/drawer/drawer_widget.dart';
import 'package:homely_dish/views/ui/profile/widgets/links_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          text: 'Profile',
          child: const DrawerWidget(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ReusableText(
                    color: Color(kOrange.value),
                    text: 'Good Morning,',
                    fontweigth: FontWeight.w400,
                    fontsize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/onboading/logo.png',
                    ),
                  ),
                  ReusableText(
                      color: Color(kDarkGreen.value),
                      text: 'Your Name',
                      fontweigth: FontWeight.bold,
                      fontsize: 18),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.edit,
                      color: Color(kSienna.value),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  TabsWidget(
                    icon: Icons.notifications_active_outlined,
                    tcolor: Color(kDarkGreen.value),
                    icolor: Color(kDarkGreen.value),
                    text: 'Notifications',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TabsWidget(
                    icon: Icons.verified_outlined,
                    tcolor: Color(kDarkGreen.value),
                    icolor: Color(kDarkGreen.value),
                    text: 'Rewards',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TabsWidget(
                    icon: Icons.settings_outlined,
                    tcolor: Color(kDarkGreen.value),
                    icolor: Color(kDarkGreen.value),
                    text: 'Settings',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TabsWidget(
                    icon: Icons.bookmark_outline_rounded,
                    tcolor: Color(kDarkGreen.value),
                    icolor: Color(kDarkGreen.value),
                    text: 'Bookmarks & Saved',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TabsWidget(
                    icon: Icons.history_outlined,
                    tcolor: Color(kDarkGreen.value),
                    icolor: Color(kDarkGreen.value),
                    text: 'History',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
