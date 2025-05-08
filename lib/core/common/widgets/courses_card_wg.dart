import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../responsiveness/app_responsive.dart';
import '../../text_styles/app_tex_style.dart';
import '../colors/app_colors.dart';

class CourseCard extends StatelessWidget {
  final VoidCallback onTap;
  final String courseImg;
  final String courseTitle;
  final String courseDuration;
  final Widget subWidget;

  const CourseCard({
    super.key,
    required this.onTap,
    required this.courseImg,
    required this.courseTitle,
    required this.courseDuration,
    required this.subWidget,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: appH(140),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.background.dark2 : AppColors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color:
                  isDarkMode
                      ? AppColors.background.dark3.withOpacity(0.3)
                      : AppColors.greyScale.grey300,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        padding: EdgeInsets.all(appH(20)),
        margin: EdgeInsets.only(bottom: appH(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                courseImg,
                width: appW(100),
                height: appH(100),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: appW(16)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    courseTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextStyles.urbanist.bold(
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      fontSize: 18,
                    ),
                  ),
                  subWidget,
                  Row(
                    children: [
                      LinearPercentIndicator(
                        width: appW(171),
                        lineHeight: 10.0,
                        percent: 50 / 100,
                        backgroundColor:
                            isDarkMode
                                ? AppColors.greyScale.grey700
                                : AppColors.greyScale.grey300,
                        progressColor: AppColors.amber,
                        barRadius: const Radius.circular(12),
                      ),
                      SizedBox(width: appW(8)),
                      Text(
                        courseDuration,
                        style: AppTextStyles.urbanist.bold(
                          color:
                              isDarkMode
                                  ? AppColors.white
                                  : AppColors.greyScale.grey700,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
