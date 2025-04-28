import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:lms_system/features/home/presentation/bloc/home_event.dart';
import 'package:lms_system/features/home/presentation/bloc/single_course/single_course_bloc.dart';
import 'package:lms_system/features/home/presentation/bloc/single_course/single_course_state.dart';
import 'package:lms_system/features/home/presentation/pages/course_details/widgets/about_screen_wg.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../core/text_styles/urbanist_text_style.dart';
import '../../widgets/course_info_wg.dart';
import '../../widgets/review_screen_wg.dart';
import 'widgets/lesson_screen_wg.dart';

class CourseDetailsPage extends StatefulWidget {
  final int id;

  const CourseDetailsPage({super.key, required this.id});

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
    context.read<SingleCourseBloc>().add(GetSingleCourseEvent(id: widget.id));
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
      body: BlocBuilder<SingleCourseBloc, SingleCourseState>(
        builder: (context, state) {
          if (state is SingleCourseLoading) {
            return Center(
              child: SpinKitFadingCircle(
                color: AppColors.primary.blue500,
                size: 60.0,
              ),
            );
          } else if (state is SingleCourseLoaded) {
            final course = state.course;
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: appH(200),
                    child: CachedNetworkImage(
                      imageUrl: course.image!,
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/course.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: appH(20)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    course.title,
                                    style: UrbanistTextStyles().bold(
                                      color: AppColors.black,
                                      fontSize: 32,
                                    ),
                                  ),
                                ),
                                Icon(
                                  IconlyLight.bookmark,
                                  color: AppColors.blue,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: AppColors.lightBlue,
                                  ),
                                  child: Text(
                                    "${course.category}",
                                    style: UrbanistTextStyles().bold(
                                      color: AppColors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Icon(IconlyBold.star, color: Colors.amber),
                                const SizedBox(width: 5),
                                Text(
                                  "0 reviews",
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  course.price,
                                  style: UrbanistTextStyles().bold(
                                    color: AppColors.blue,
                                    fontSize: 32,
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CourseInfoWidget(
                                  icon: Icon(
                                    IconlyBold.user_3,
                                    color: AppColors.blue,
                                    size: 20,
                                  ),
                                  title: 'Students',
                                ),
                                CourseInfoWidget(
                                  icon: Icon(
                                    IconlyBold.time_circle,
                                    color: AppColors.blue,
                                    size: 16,
                                  ),
                                  title: '0 Hours',
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
                    tabs: const [
                      Tab(text: 'About'),
                      Tab(text: 'Lessons'),
                      Tab(text: 'Reviews'),
                    ],
                  ),
                  // TabBarView
                  SizedBox(
                    height: MediaQuery.of(context).size.height -
                        kToolbarHeight -
                        kBottomNavigationBarHeight -
                        200,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        AboutScreen(course: course),
                        LessonScreen(),
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
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Text(
                        "Enroll Course - ${course.price}",
                        style: const TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is SingleCourseError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}