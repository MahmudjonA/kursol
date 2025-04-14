import 'package:flutter/material.dart';

import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/text_styles/urbanist_text_style.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

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
                  '124 Lessons',
                  style: UrbanistTextStyles().bold(
                    fontSize: 20,
                    color: AppColors.black,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'See All',
                    style: UrbanistTextStyles().bold(
                      fontSize: 20,
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ],
            ),
            // CourseLessonWidget(
            //   // sections: courseDetail,
            //   isDarkMode: isDarkMode,
            // ),
          ],
        ),
      ),
    );
  }
}
