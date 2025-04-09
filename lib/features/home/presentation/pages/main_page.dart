// import 'package:flutter/material.dart';
// import 'package:iconly/iconly.dart';
// import 'package:lms_system/core/route/rout_names.dart';
//
// import '../../../../core/common/colors/app_colors.dart';
// import '../../../../core/responsiveness/app_responsive.dart';
// import '../../../../core/text_styles/app_tex_style.dart';
//
// class MainPage extends StatefulWidget {
//   final Widget child;
//
//   const MainPage({super.key, required this.child});
//
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   int _currentIndex = 0;
//
//   static List<MyCustomBottomNavBarItem> tabs = [
//     MyCustomBottomNavBarItem(
//       icon: Icon(IconlyLight.home),
//       activeIcon: Icon(IconlyBold.home),
//       label: "Home",
//       initialLocation: RouteNames.home,
//     ),
//     MyCustomBottomNavBarItem(
//       icon: Icon(IconlyLight.document),
//       activeIcon: Icon(IconlyBold.document),
//       label: "My Course",
//       initialLocation: RouteNames.home,
//     ),
//     MyCustomBottomNavBarItem(
//       icon: Icon(IconlyLight.chat),
//       activeIcon: Icon(IconlyBold.chat),
//       label: "Test",
//       initialLocation: RouteNames.home,
//     ),
//     MyCustomBottomNavBarItem(
//       icon: Icon(IconlyLight.buy),
//       activeIcon: Icon(IconlyBold.buy),
//       label: "Transactions",
//       initialLocation: RouteNames.home,
//     ),
//     MyCustomBottomNavBarItem(
//       icon: Icon(IconlyLight.profile),
//       activeIcon: Icon(IconlyBold.profile),
//       label: "Profile",
//       initialLocation: RouteNames.home,
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     void goOtherTab(BuildContext context, int index) {
//       if (index == _currentIndex) return;
//
//       GoRouter router = GoRouter.of(context);
//       String location = tabs[index].initialLocation;
//
//       if (index == 4) {
//         router.replace(location);
//       } else {
//         router.go(location);
//       }
//
//       setState(() {
//         _currentIndex = index;
//       });
//     }
//
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: widget.child,
//       bottomNavigationBar: SizedBox(
//         height: appH(95),
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           iconSize: appW(28),
//           backgroundColor: AppColors.white,
//           currentIndex: _currentIndex,
//           selectedItemColor: AppColors.primary(),
//           unselectedItemColor: AppColors.greyScale.grey500,
//           onTap: (int index) => goOtherTab(context, index),
//           selectedLabelStyle: AppTextStyles.urbanist.bold(
//             color: AppColors.primary(),
//             fontSize: 10,
//           ),
//           unselectedLabelStyle: AppTextStyles.urbanist.medium(
//             color: AppColors.greyScale.grey500,
//             fontSize: 10,
//           ),
//           items: List<BottomNavigationBarItem>.from(tabs),
//         ),
//       ),
//     );
//   }
// }
//
// class MyCustomBottomNavBarItem extends BottomNavigationBarItem {
//   final String initialLocation;
//
//   const MyCustomBottomNavBarItem({
//     required this.initialLocation,
//     required super.icon,
//     super.label,
//     Widget? activeIcon,
//   }) : super(activeIcon: activeIcon ?? icon);
// }

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/responsiveness/app_responsive.dart';
import '../../../../core/text_styles/app_tex_style.dart';
import '../../../../core/route/rout_names.dart';
import 'home_page.dart'; // Make sure you have the correct routes

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // List of tabs with corresponding icons and initial routes
  static List<MyCustomBottomNavBarItem> tabs = [
    MyCustomBottomNavBarItem(
      icon: Icon(IconlyLight.home),
      activeIcon: Icon(IconlyBold.home),
      label: "Home",
      initialLocation: RouteNames.home,
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(IconlyLight.document),
      activeIcon: Icon(IconlyBold.document),
      label: "My Course",
      initialLocation: RouteNames.home,
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(IconlyLight.chat),
      activeIcon: Icon(IconlyBold.chat),
      label: "Test",
      initialLocation: RouteNames.home,
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(IconlyLight.buy),
      activeIcon: Icon(IconlyBold.buy),
      label: "Transactions",
      initialLocation: RouteNames.home,
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(IconlyLight.profile),
      activeIcon: Icon(IconlyBold.profile),
      label: "Profile",
      initialLocation: RouteNames.home,
    ),
  ];

  // List of pages for each tab
  List<Widget> pages = [
    const HomePage(), // Replace with the actual widget for each tab
    const HomePage(), // Replace with the actual widget for the second tab
    const HomePage(), // And so on...
    const HomePage(),
    const HomePage(),
  ];

  // Method for navigating between tabs
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
      body: pages[_currentIndex], // Switch the body content based on selected tab
      bottomNavigationBar: SizedBox(
        height: appH(95),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: appW(28),
          backgroundColor: AppColors.white,
          currentIndex: _currentIndex,
          selectedItemColor: AppColors.primary(),
          unselectedItemColor: AppColors.greyScale.grey500,
          onTap: (int index) => goOtherTab(index), // Just update the selected tab
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
  final String initialLocation;

  const MyCustomBottomNavBarItem({
    required this.initialLocation,
    required super.icon,
    super.label,
    Widget? activeIcon,
  }) : super(activeIcon: activeIcon ?? icon);
}
