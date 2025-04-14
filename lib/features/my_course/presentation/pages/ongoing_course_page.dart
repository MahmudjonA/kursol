import 'package:flutter/material.dart';
import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../core/common/widgets/custom_bottom_bar_wg.dart';
import '../../../../core/responsiveness/app_responsive.dart';
import '../widgets/lesson_list_widget.dart';

class OngoingCourse extends StatelessWidget {
  final String courseId;

  const OngoingCourse({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    //
    // final courseDetail = dummyCourseDetails.firstWhere(
    //   (course) => course.id == courseId,
    // );
    // final course = completedCourses.firstWhere(
    //   (course) => course.id == courseId,
    //   orElse: () => CourseModel(
    //     id: '',
    //     title: '',
    //     duration: '',
    //     imageUrl: '',
    //     progress: 0,
    //   ),
    // );

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.background.dark : Colors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          Navigator.pop(context);
        },
        titleText: "courseDetail.title",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(16)),
        child: SingleChildScrollView(
          // child: LessonListWidget(
          //   // sections: [],
          //   isDarkMode: isDarkMode,
          // ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        isDarkMode: isDarkMode,
        onPressed: () {
          // if (course.progress == 100) {
          //   context.push('/completed-courses');
          // } else {
          //   context.push(
          //     '/video-player',
          //     extra: {
          //       'videoUrl':
          //           'https://www.pexels.com/video/close-up-of-a-cpu-7140928/',
          //       'title': courseDetail.title,
          //     },
          //   );
          // }
        },
        buttonText: "AppStrings.continueCourse",
      ),
    );
  }
}
