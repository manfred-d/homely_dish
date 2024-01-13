import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/controllers/onboardng_provider.dart';
import 'package:homely_dish/views/onboarding/widgets/page_one.dart';
import 'package:homely_dish/views/onboarding/widgets/page_two.dart';
import 'package:homely_dish/views/onboarding/widgets/page_zero.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnBoadingNotifier>(
        builder: (context, onBoardNotifier, child) {
          return Stack(
            children: [
              PageView(
                physics: onBoardNotifier.isLastPage
                    ? const NeverScrollableScrollPhysics()
                    : const AlwaysScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: (page) {
                  onBoardNotifier.isLastPage = page == 2;
                },
                children: const [
                  PageZero(),
                  PageOne(),
                  PageTwo(),
                ],
              ),
              Positioned(
                right: width * 0.02,
                top: height * 0.05,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30.h,
                  ),
                  child: onBoardNotifier.isLastPage
                      ? const SizedBox.shrink()
                      : Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                pageController.jumpToPage(2);
                              },
                              child: Text(
                                'SKIP',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(kLight.value),
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              Positioned(
                bottom: height * 0.08,
                left: 0,
                right: 0,
                child: onBoardNotifier.isLastPage
                    ? const SizedBox.shrink()
                    : Center(
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 3,
                          effect: WormEffect(
                            dotHeight: 10,
                            dotWidth: 20,
                            spacing: 10,
                            activeDotColor: Color(kDark.value),
                            dotColor: Color(kLightBlue.value).withOpacity(0.6),
                          ),
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
