// import 'package:flutter/material.dart';
// import 'package:iconly/iconly.dart';
// import '../../../../core/common/colors/app_colors.dart';
// import '../../../../core/responsiveness/app_responsive.dart';
// import '../../../../core/text_styles/urbanist_text_style.dart';
// import '../pages/video_player_page.dart';
//
// class LessonListWidget extends StatelessWidget {
//   // final List<CourseSection> sections;
//   final bool isDarkMode;
//
//   const LessonListWidget({
//     super.key,
//     // required this.sections,
//     required this.isDarkMode,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       children:
//       sections.map((section) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: appH(18)),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "section.title",
//                   style: UrbanistTextStyles().semiBold(
//                     color: isDarkMode ? Colors.white : AppColors.greyScale.grey500,
//                     fontSize: appH(18),
//                   ),
//                 ),
//                 Text(
//                   "section.duration",
//                   style: UrbanistTextStyles().semiBold(
//                     color: AppColors.primary.blue500,
//                     fontSize: appH(16),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: appH(12)),
//             Column(
//               children: section.lessons.map((lesson) {
//                 return Container(
//                   margin: EdgeInsets.only(bottom: appH(12)),
//                   decoration: BoxDecoration(
//                     color: isDarkMode ? AppColors.background.dark2 : Colors.white,
//                     borderRadius: BorderRadius.circular(appH(18)),
//                     boxShadow: [
//                       if (!isDarkMode)
//                         BoxShadow(
//                           // ignore: deprecated_member_use
//                           color: Colors.black.withOpacity(0.05),
//                           blurRadius: appH(12),
//                           offset: Offset(0, appH(4)),
//                         ),
//                     ],
//                   ),
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: isDarkMode
//                           // ignore: deprecated_member_use
//                           ? AppColors.primary.blue500.withOpacity(0.2)
//                           // ignore: deprecated_member_use
//                           : AppColors.primary.blue200.withOpacity(0.2),
//                       radius: appH(24),
//                       child: Text(
//                         lesson.id,
//                         style: UrbanistTextStyles().bold(
//                           color: AppColors.primary.blue500,
//                           fontSize: appH(18),
//                         ),
//                       ),
//                     ),
//                     title: Text(
//                       lesson.title,
//                       style: UrbanistTextStyles().semiBold(
//                         color: isDarkMode ? Colors.white : Colors.black87,
//                         fontSize: appH(18),
//                       ),
//                     ),
//                     subtitle: Text(
//                       lesson.duration,
//                       style: UrbanistTextStyles().regular(
//                         color: isDarkMode ? AppColors.greyScale.grey400 : Colors.grey,
//                         fontSize: appH(16),
//                       ),
//                     ),
//                     trailing: GestureDetector(
//                       onTap: () {
//                         if (!lesson.isLocked) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => VideoPlayerPage(
//                                 videoUrl: "https://videos.pexels.com/video-files/7140928/7140928-uhd_2560_1440_24fps.mp4",
//                                 title: lesson.title,
//                               ),
//                             ),
//                           );
//                         }
//                       },
//                       child: Icon(
//                         lesson.isLocked ? IconlyLight.lock : IconlyBold.play,
//                         size: appH(28),
//                         color: lesson.isLocked ? AppColors.greyScale.grey500 : AppColors.primary.blue500,
//                       ),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ],
//         );
//       }).toList(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/responsiveness/app_responsive.dart';
import '../../../../core/text_styles/urbanist_text_style.dart';
import '../pages/video_player_page.dart';

class LessonListWidget extends StatelessWidget {
  final bool isDarkMode;

  const LessonListWidget({
    super.key,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        // section 1
        SizedBox(height: appH(18)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Introduction",
              style: UrbanistTextStyles().semiBold(
                color: isDarkMode ? Colors.white : AppColors.greyScale.grey500,
                fontSize: appH(18),
              ),
            ),
            Text(
              "12 min",
              style: UrbanistTextStyles().semiBold(
                color: AppColors.primary.blue500,
                fontSize: appH(16),
              ),
            ),
          ],
        ),
        SizedBox(height: appH(12)),

        // lessons in section 1
        _buildLessonTile(context, "1", "Welcome", "2 min", false),
        _buildLessonTile(context, "2", "How this course works", "4 min", false),
        _buildLessonTile(context, "3", "Meet your instructor", "6 min", true),

        // section 2
        SizedBox(height: appH(18)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Getting Started",
              style: UrbanistTextStyles().semiBold(
                color: isDarkMode ? Colors.white : AppColors.greyScale.grey500,
                fontSize: appH(18),
              ),
            ),
            Text(
              "18 min",
              style: UrbanistTextStyles().semiBold(
                color: AppColors.primary.blue500,
                fontSize: appH(16),
              ),
            ),
          ],
        ),
        SizedBox(height: appH(12)),

        // lessons in section 2
        _buildLessonTile(context, "4", "Installation", "5 min", false),
        _buildLessonTile(context, "5", "Project Setup", "7 min", true),
        _buildLessonTile(context, "6", "First Widget", "6 min", true),
      ],
    );
  }

  Widget _buildLessonTile(BuildContext context, String id, String title, String duration, bool isLocked) {
    return Container(
      margin: EdgeInsets.only(bottom: appH(12)),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.background.dark2 : Colors.white,
        borderRadius: BorderRadius.circular(appH(18)),
        boxShadow: [
          if (!isDarkMode)
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: appH(12),
              offset: Offset(0, appH(4)),
            ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isDarkMode
              ? AppColors.primary.blue500.withOpacity(0.2)
              : AppColors.primary.blue200.withOpacity(0.2),
          radius: appH(24),
          child: Text(
            id,
            style: UrbanistTextStyles().bold(
              color: AppColors.primary.blue500,
              fontSize: appH(18),
            ),
          ),
        ),
        title: Text(
          title,
          style: UrbanistTextStyles().semiBold(
            color: isDarkMode ? Colors.white : Colors.black87,
            fontSize: appH(18),
          ),
        ),
        subtitle: Text(
          duration,
          style: UrbanistTextStyles().regular(
            color: isDarkMode ? AppColors.greyScale.grey400 : Colors.grey,
            fontSize: appH(16),
          ),
        ),
        trailing: GestureDetector(
          onTap: () {
            if (!isLocked) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerPage(
                    videoUrl: "https://videos.pexels.com/video-files/7140928/7140928-uhd_2560_1440_24fps.mp4",
                    title: title,
                  ),
                ),
              );
            }
          },
          child: Icon(
            isLocked ? IconlyLight.lock : IconlyBold.play,
            size: appH(28),
            color: isLocked ? AppColors.greyScale.grey500 : AppColors.primary.blue500,
          ),
        ),
      ),
    );
  }
}
