import 'package:flutter/material.dart';
import 'package:lms_system/core/route/rout_generator.dart';
import 'package:lms_system/features/my_course/presentation/pages/completed_course_page.dart';
import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/common/widgets/courses_card_wg.dart';
import '../../../../core/common/widgets/custom_tab_bar_wg.dart';
import '../../../../core/common/widgets/default_app_bar_wg.dart';
import '../../../../core/responsiveness/app_responsive.dart';
import '../../../../core/text_styles/app_tex_style.dart';

class MyCoursePage extends StatefulWidget {
  const MyCoursePage({super.key});

  @override
  State<MyCoursePage> createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScale.grey50,
      appBar: DefaultAppBarWg(titleText: "My Courses", onMorePressed: () {}),
      body: Column(
        children: [
          CustomTabBar(
            tabController: _tabController,
            tabTitles: ["Ongoing", "Completed"],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: appW(10)),
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CourseCard(
                        onTap: () {
                          AppRoute.go(CompletedCoursePage());
                        },
                        courseImg: 'assets/images/course.png',
                        courseTitle: 'Course Title',
                        subWidget: Text(
                          "20 hrs",
                          style: AppTextStyles.urbanist.medium(
                            color: AppColors.greyScale.grey700,
                            fontSize: 14,
                          ),
                        ),
                        courseDuration: '100 / 100',
                      );
                    },
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CourseCard(
                        onTap: () {},
                        courseImg: 'assets/images/course.png',
                        courseTitle: 'Course Title',
                        subWidget: Text(
                          "20 hrs",
                          style: AppTextStyles.urbanist.medium(
                            color: AppColors.greyScale.grey700,
                            fontSize: 14,
                          ),
                        ),
                        courseDuration: '100 / 100',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
