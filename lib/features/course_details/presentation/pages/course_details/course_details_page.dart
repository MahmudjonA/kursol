import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lms_system/features/course_details/presentation/pages/course_details/widgets/about_screen_wg.dart';
import 'package:lms_system/features/course_details/presentation/widgets/review_screen_wg.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/widgets/video_player_wg.dart';
import '../../../../../core/text_styles/urbanist_text_style.dart';
import '../../widgets/course_info_wg.dart';
import 'widgets/lesson_screen_wg.dart';

class CourseDetailsPage extends StatefulWidget {
  const CourseDetailsPage({super.key});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomVideoPlayer(
              videoUrl:
                  "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            ),
            // Course Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Intro to UI/UX Design',
                            style: UrbanistTextStyles().bold(
                              color: AppColors.black,
                              fontSize: 32,
                            ),
                          ),
                          Icon(IconlyLight.bookmark, color: AppColors.blue),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors.lightBlue,
                            ),
                            child: Text(
                              'UI/UX Design',
                              style: UrbanistTextStyles().bold(
                                color: AppColors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Icon(IconlyBold.star, color: Colors.amber),
                          const SizedBox(width: 5),
                          Text(
                            '4.8 (4,479 reviews)',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '\$40',
                            style: UrbanistTextStyles().bold(
                              color: AppColors.blue,
                              fontSize: 32,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '\$75',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.blueGrey,
                              decoration: TextDecoration.lineThrough,
                              fontFamily: "Urbanist",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CourseInfoWidget(
                            icon: Icon(
                              IconlyBold.user_3,
                              color: AppColors.blue,
                              size: 20,
                            ),
                            title: '9,839 Students',
                          ),
                          CourseInfoWidget(
                            icon: Icon(
                              IconlyBold.time_circle,
                              color: AppColors.blue,
                              size: 16,
                            ),
                            title: '2.5 Hours',
                          ),
                          CourseInfoWidget(
                            icon: Icon(
                              IconlyBold.document,
                              color: AppColors.blue,
                              size: 20,
                            ),
                            title: 'Certificate',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Tabs
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'About'),
                Tab(text: 'Lessons'),
                Tab(text: 'Reviews'),
              ],
            ),
            // TabBarView
            SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // About Tab
                  AboutScreen(),
                  // Lessons Tab
                  LessonScreen(),
                  // Reviews Tab
                  ReviewsScreen(),
                ],
              ),
            ),
            // Enroll Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  "Enroll Course - \$440",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
