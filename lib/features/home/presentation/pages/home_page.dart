import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:lms_system/core/route/rout_generator.dart';
import 'package:lms_system/features/home/presentation/bloc/category/category_bloc.dart';
import 'package:lms_system/features/home/presentation/bloc/top_mentors/top_mentors_state.dart';
import 'package:lms_system/features/home/presentation/pages/courses/popular_courses.dart';
import 'package:lms_system/features/home/presentation/pages/mentors/mentors_page.dart';
import 'package:lms_system/features/home/presentation/pages/search/search_page.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/common/widgets/custom_choice_chip_wg.dart';
import '../../../../core/responsiveness/app_responsive.dart';
import '../../../../core/text_styles/urbanist_text_style.dart';
import '../bloc/category/category_state.dart';
import '../bloc/courses/courses_bloc.dart';
import '../bloc/courses/courses_state.dart';
import '../bloc/home_event.dart';
import '../bloc/top_mentors/top_mentors_bloc.dart';
import '../widgets/course_card_widget.dart';
import '../widgets/top_mentors.dart';
import 'bookmark/bookmark_page.dart';
import 'course_details/course_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CourseBloc>().add(GetPopularCourses(limit: 10));
    context.read<TopMentorsBloc>().add(GetTopMentors(limit: 10));
    context.read<CategoryBloc>().add(GetCategoriesEvent(limit: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScale.grey50,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        toolbarHeight: appH(100),
        title: Row(
          children: [
            CircleAvatar(
              radius: appH(30),
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
            SizedBox(width: appW(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hello, User',
                  style: UrbanistTextStyles().medium(
                    color: AppColors.greyScale.grey600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: appH(10)),
                Text(
                  'LMS System',
                  style: UrbanistTextStyles().semiBold(
                    color: AppColors.greyScale.grey900,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          // IconButton(
          //   icon: Icon(IconlyLight.notification, size: appH(28)),
          //   onPressed: () {
          //     AppRoute.go(NotificationPage());
          //   },
          // ),
          IconButton(
            icon: Icon(IconlyLight.bookmark, size: appH(28)),
            onPressed: () {
              AppRoute.go(BookmarkPage());
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(16)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: appH(56),
                decoration: BoxDecoration(
                  color: AppColors.greyScale.grey100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: appW(16),
                      vertical: appH(12),
                    ),
                  ),
                  onPressed: () {
                    AppRoute.open(SearchPage());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        IconlyLight.search,
                        size: appH(20),
                        color: AppColors.greyScale.grey400,
                      ),
                      SizedBox(width: appW(20)),
                      Text(
                        'Search',
                        style: UrbanistTextStyles().semiBold(
                          color: AppColors.greyScale.grey400,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        IconlyLight.filter,
                        size: appH(20),
                        color: AppColors.primary.blue400,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: appH(10)),
              SizedBox(
                width: double.infinity,
                height: appH(210),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset('assets/images/Frame.png', fit: BoxFit.cover),
                    Image.asset(
                      'assets/images/green_offer.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/red_offer.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Mentors",
                    style: UrbanistTextStyles().bold(
                      fontSize: 20,
                      color: AppColors.greyScale.grey900,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AppRoute.go(MentorsPage());
                    },
                    child: Text(
                      "See All",
                      style: UrbanistTextStyles().bold(
                        fontSize: 16,
                        color: AppColors.primary.blue500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: appH(10)),
              BlocBuilder<TopMentorsBloc, TopMentorsState>(
                builder: (context, state) {
                  if (state is TopMentorsLoading) {
                    return SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: appW(12)),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: appW(90),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.all(appW(8)),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is TopMentorsLoaded) {
                    final mentors = state.mentors.results;
                    return mentors.isEmpty
                        ? Center(child: Text('No mentors available'))
                        : SizedBox(
                          height: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.mentors.count,
                            itemBuilder: (context, index) {
                              final mentor = mentors[index];
                              return columnWg(
                                mentor.avatarUrl ?? 'Null',
                                mentor.fullName,
                              );
                            },
                          ),
                        );
                  } else if (state is TopMentorsError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              SizedBox(height: appH(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Most Popular Courses",
                    style: UrbanistTextStyles().bold(
                      fontSize: 20,
                      color: AppColors.greyScale.grey900,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AppRoute.go(PopularCourses());
                    },
                    child: Text(
                      "See All",
                      style: UrbanistTextStyles().bold(
                        fontSize: 16,
                        color: AppColors.primary.blue500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: appH(10)),
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: appW(12)),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: appW(90),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.all(appW(8)),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is CategoryLoaded) {
                    final categories = state.categories;
                    return SizedBox(
                      height: appH(40),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.count + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return CustomChoiceChipWg(
                              index: -1,
                              label: 'All',
                              selectedIndex: selectedIndex,
                              onSelected: (selected) {
                                setState(() {
                                  selectedIndex = selected ? -1 : selectedIndex;
                                });
                                context.read<CourseBloc>().add(
                                  GetPopularCourses(limit: 10),
                                );
                              },
                            );
                          } else {
                            final category = categories.results[index - 1];
                            return CustomChoiceChipWg(
                              index: index - 1,
                              label: category.name,
                              selectedIndex: selectedIndex,
                              onSelected: (selected) {
                                setState(() {
                                  selectedIndex =
                                      selected ? index - 1 : selectedIndex;
                                });
                                context.read<CourseBloc>().add(
                                  GetPopularCourses(
                                    limit: 10,
                                    categoryId: category.id,
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    );
                  } else if (state is CategoryError) {
                    return Center(child: Text('Ошибка: ${state.message}'));
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(height: appH(8)),
              BlocBuilder<CourseBloc, CourseState>(
                builder: (context, state) {
                  if (state is CourseLoading) {
                    return SizedBox(
                      height: 320,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: appW(12)),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: appH(120),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.all(appW(8)),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is CourseLoaded) {
                    final courses = state.courses;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: courses.count,
                      itemBuilder: (context, index) {
                        final course = courses.results[index];
                        return CourseCard(
                          onTap: () {
                            AppRoute.go(CourseDetailsPage(id: course.id));
                          },
                          imagePath: course.image!,
                          category: course.categoryName!,
                          title: course.title,
                          price: double.tryParse(course.price) ?? 0,
                          oldPrice: 80,
                          rating: 4.8,
                          students: 8289,
                          isInWishlist: course.isInWishlist,
                          courseId: course.id,
                          onBookmarkPressed: () {},
                        );
                      },
                    );
                  } else if (state is CourseError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
