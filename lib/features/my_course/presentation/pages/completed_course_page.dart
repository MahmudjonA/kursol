import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lms_system/features/my_course/presentation/widgets/lesson_list_widget.dart';
import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/common/widgets/custom_bottom_bar_wg.dart';
import '../../../../core/common/widgets/custom_tab_bar_wg.dart';
import '../../../../core/text_styles/app_tex_style.dart';
import '../widgets/sertificate_wg.dart';

class CompletedCoursePage extends StatefulWidget {

  const CompletedCoursePage({super.key,});

  @override
  _CompletedCoursePageState createState() => _CompletedCoursePageState();
}

class _CompletedCoursePageState extends State<CompletedCoursePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String buttonText;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    buttonText = "Start Course Again";

    _tabController.addListener(() {
      setState(() {
        buttonText =
            _tabController.index == 1
                ? "Download Certificate"
                : "Start Course Again";
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.background.dark : AppColors.white,
        appBar: AppBar(
          title: Text(
            "Course Title",
            style: AppTextStyles.urbanist.bold(
              color: isDarkMode ? AppColors.white : AppColors.black,
              fontSize: 22,
            ),
          ),
          backgroundColor:
              isDarkMode ? AppColors.background.dark : AppColors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              IconlyLight.arrow_left,
              color: isDarkMode ? AppColors.white : Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          bottom: CustomTabBar(
            tabController: _tabController,
            tabTitles: ["Lessons", "Certificates"],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TabBarView(
            controller: _tabController,
            children: [
              // Lessons Tab
              // SingleChildScrollView(
              //   // child: LessonListWidget(
              //   //   // sections: [],
              //   //   isDarkMode: isDarkMode,
              //   // ),
              // ),
              LessonListWidget(isDarkMode: isDarkMode),
              // Certificates Tab
              Center(child: CertificateWidget()),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          buttonText: buttonText,
          isDarkMode: isDarkMode,
          onPressed: () {},
        ),
      ),
    );
  }
}
