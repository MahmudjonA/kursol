import 'package:flutter/material.dart';
import 'package:lms_system/features/home/domain/entities/sections.dart';

import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/text_styles/urbanist_text_style.dart';
import 'course_lesson_wg.dart';

class LessonScreen extends StatefulWidget {
  final List<Section> sections;

  const LessonScreen({super.key, required this.sections});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.sections[0].lessons.length} Lessons",
                  style: UrbanistTextStyles().bold(
                    fontSize: 20,
                    color: AppColors.black,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'See All',
                    style: UrbanistTextStyles().bold(
                      fontSize: 18,
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ],
            ),
            CourseLessonWidget(section: widget.sections),
          ],
        ),
      ),
    );
  }
}
