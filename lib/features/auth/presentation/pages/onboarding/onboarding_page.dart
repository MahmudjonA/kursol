import 'package:flutter/material.dart';
import 'package:lms_system/core/route/rout_names.dart';
import 'package:lms_system/features/auth/presentation/pages/onboarding/widget/onboarding_widget.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/sizes/sizes.dart';
import '../../../../../core/common/widgets/buttons/default_button_wg.dart';
import '../../../../../core/responsiveness/app_responsive.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> texts = [
    "We provide the best learning courses & great mentors!",
    "Learn anytime and anywhere easily and conveniently",
    "Let's improve your skills together with Elera right now!",
  ];

  final List<String> images = [
    "assets/images/splash3.png",
    "assets/images/splash4.png",
    "assets/images/splash5.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: scaffoldPadding48,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          spacing: appH(60),
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: texts.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder:
                    (context, index) => BoardingWidget(
                      text: texts[index],
                      image: images[index],
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                texts.length,
                (index) => _buildDot(index),
              ),
            ),
            DefaultButtonWg(
              title: _currentPage == texts.length - 1 ? "Get Started" : "Next",
              onPressed: () {
                if (_currentPage < texts.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
                if (_currentPage == texts.length - 1) {
                  Navigator.pushNamed(context, RouteNames.auth);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: appW(5)),
      width: _currentPage == index ? appW(32) : appW(8),
      height: appH(8),
      decoration: BoxDecoration(
        color:
            _currentPage == index
                ? AppColors.primary()
                : AppColors.greyScale.grey300,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
