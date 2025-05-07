import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:lms_system/core/route/rout_generator.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../../core/common/widgets/custom_choice_chip_wg.dart';
import '../../../../../core/responsiveness/app_responsive.dart';
import '../../bloc/category/category_bloc.dart';
import '../../bloc/category/category_state.dart';
import '../../bloc/courses/courses_bloc.dart';
import '../../bloc/courses/courses_state.dart';
import '../../bloc/home_event.dart';
import '../../widgets/course_card_widget.dart';
import '../course_details/course_details_page.dart';

class PopularCourses extends StatefulWidget {
  const PopularCourses({super.key});

  @override
  State<PopularCourses> createState() => _PopularCoursesState();
}

class _PopularCoursesState extends State<PopularCourses> {
  int selectedIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CourseBloc>().add(
      GetPopularCourses(limit: 10, categoryId: null),
    );
    context.read<CategoryBloc>().add(GetCategoriesEvent(limit: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScale.grey50,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          AppRoute.close();
        },
        titleText: "Most Popular Courses",
        actions: [
          IconButton(
            icon: Icon(IconlyLight.search, size: appH(28)),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(14)),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
