import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_system/features/profile/presentation/pages/help_center/widgets/contact_us_tab.dart';
import 'package:lms_system/features/profile/presentation/pages/help_center/widgets/faq_tab.dart';

import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../../core/common/widgets/custom_tab_bar_wg.dart';
import '../../../../../core/responsiveness/app_responsive.dart';

class ProfileHelpCenterPage extends StatefulWidget {
  const ProfileHelpCenterPage({super.key});

  @override
  State<ProfileHelpCenterPage> createState() => _ProfileHelpCenterPageState();
}

class _ProfileHelpCenterPageState extends State<ProfileHelpCenterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScale.grey50,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          context.pop();
        },
        titleText: "Help Center",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(24)),
        child: Column(
          spacing: appH(24),
          children: [
            CustomTabBar(
              tabController: _tabController,
              tabTitles: ["Faq", "Contact Us"],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [FaqTab(), ContactUsTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
