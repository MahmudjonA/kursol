import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lms_system/features/profile/presentation/pages/profile_page.dart';
import 'package:lms_system/features/tets/presentation/pages/test_page.dart';
import 'package:lms_system/features/transaction/presentation/pages/transactions_page.dart';
import '../core/common/colors/app_colors.dart';
import '../core/responsiveness/app_responsive.dart';
import '../core/text_styles/app_tex_style.dart';
import 'my_course/presentation/pages/my_course_page.dart';
import 'home/presentation/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  static List<MyCustomBottomNavBarItem> tabs = [
    MyCustomBottomNavBarItem(
      icon: Icon(IconlyLight.home),
      activeIcon: Icon(IconlyBold.home),
      label: "Home",
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(IconlyLight.document),
      activeIcon: Icon(IconlyBold.document),
      label: "My Course",
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(IconlyLight.chart),
      activeIcon: Icon(IconlyBold.chart),
      label: "Test",
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(IconlyLight.buy),
      activeIcon: Icon(IconlyBold.buy),
      label: "Transactions",
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(IconlyLight.profile),
      activeIcon: Icon(IconlyBold.profile),
      label: "Profile",
    ),
  ];

  List<Widget> pages = [
    const HomePage(),
    const MyCoursePage(),
    const TestPage(),
    const TransactionsPage(),
    const ProfilePage(),
  ];

  void goOtherTab(int index) {
    if (index == _currentIndex) return;

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: pages[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: appH(95),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: appW(28),
          backgroundColor: AppColors.white,
          currentIndex: _currentIndex,
          selectedItemColor: AppColors.primary(),
          unselectedItemColor: AppColors.greyScale.grey500,
          onTap: (int index) => goOtherTab(index),
          // Just update the selected tab
          selectedLabelStyle: AppTextStyles.urbanist.bold(
            color: AppColors.primary(),
            fontSize: 10,
          ),
          unselectedLabelStyle: AppTextStyles.urbanist.medium(
            color: AppColors.greyScale.grey500,
            fontSize: 10,
          ),
          items: tabs,
        ),
      ),
    );
  }
}

class MyCustomBottomNavBarItem extends BottomNavigationBarItem {
  const MyCustomBottomNavBarItem({
    required super.icon,
    super.label,
    Widget? activeIcon,
  }) : super(activeIcon: activeIcon ?? icon);
}
