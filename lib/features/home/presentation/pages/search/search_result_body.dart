import 'package:flutter/material.dart';
import 'package:lms_system/features/home/domain/entities/search_response.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../core/route/rout_generator.dart';
import '../../../../../core/text_styles/urbanist_text_style.dart';
import '../../widgets/chats_widget.dart';
import '../../widgets/course_card_widget.dart';
import '../course_details/course_details_page.dart';
import 'not_found_body.dart';

class SearchResultBody extends StatefulWidget {
  final SearchResponse searchResponse;
  final String query;

  const SearchResultBody({
    super.key,
    required this.query,
    required this.searchResponse,
  });

  @override
  State<SearchResultBody> createState() => _SearchResultBodyState();
}

class _SearchResultBodyState extends State<SearchResultBody> {
  String selectedButton = 'Courses';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: appW(20)),
      child: Column(
        children: [
          SizedBox(height: appH(25)),
          Row(
            children: [
              Expanded(child: _buildCustomButton('Courses')),
              SizedBox(width: appW(10)),
              Expanded(child: _buildCustomButton('Mentors')),
            ],
          ),
          SizedBox(height: appH(24)),
          Row(
            children: [
              Text(
                'Results for ',
                style: UrbanistTextStyles().bold(
                  color: AppColors.greyScale.grey900,
                  fontSize: 20,
                ),
              ),
              Text(
                '“${widget.query}”',
                style: UrbanistTextStyles().bold(
                  color: AppColors.primary.blue500,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              Text(
                '0 found',
                style: UrbanistTextStyles().bold(
                  color: AppColors.primary.blue500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: appH(20)),
          Expanded(
            child:
                selectedButton == 'Courses'
                    ? (widget.searchResponse.courses.isEmpty
                        ? NotFoundPage()
                        : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.searchResponse.courses.length,
                          itemBuilder: (context, index) {
                            final course = widget.searchResponse.courses[index];
                            return CourseCard(
                              onTap: () {
                                AppRoute.go(CourseDetailsPage(id: course.id));
                              },
                              imagePath: course.image!,
                              category: "${course.category}",
                              title: course.title,
                              price: double.tryParse(course.price) ?? 0,
                              oldPrice: 80,
                              rating: 4.8,
                              students: 8289,
                              onBookmarkPressed: () {},
                            );
                          },
                        ))
                    : (widget.searchResponse.mentors.isEmpty
                        ? NotFoundPage()
                        : ListView.builder(
                          itemCount: widget.searchResponse.mentors.length,
                          itemBuilder: (context, index) {
                            final mentor = widget.searchResponse.mentors[index];
                            return ChatsWidget(
                              imagePath: 'assets/images/boy.png',
                              name: mentor.fullName,
                              jobTitle: mentor.expertiseDisplay,
                            );
                          },
                        )),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomButton(String title) {
    bool isSelected = selectedButton == title;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedButton = title;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? AppColors.primary.blue500 : AppColors.white,
        side: BorderSide(color: AppColors.primary.blue500, width: appW(2)),
        padding: EdgeInsets.symmetric(horizontal: appW(55), vertical: appH(14)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Text(
        title,
        style: UrbanistTextStyles().bold(
          color: isSelected ? AppColors.white : AppColors.primary.blue500,
          fontSize: 18,
        ),
      ),
    );
  }
}
