import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lms_system/core/route/rout_generator.dart';
import 'package:lms_system/core/route/rout_names.dart';
import 'package:lms_system/features/home/presentation/pages/mentor_profile/mentor_profile_page.dart';

import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/text_styles/urbanist_text_style.dart';
import '../../../../domain/entities/courses.dart';

class AboutScreen extends StatefulWidget {
  final Course course;

  const AboutScreen({super.key, required this.course});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mentor',
            style: UrbanistTextStyles().bold(
              fontSize: 26,
              color: AppColors.black,
            ),
          ),
          GestureDetector(
            onTap: () {
              AppRoute.go(MentorProfilePage());
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  IconlyBold.user_3,
                  size: 30,
                  color: AppColors.white,
                ),
              ),
              title: Text(
                widget.course.instructor,
                style: UrbanistTextStyles().bold(
                  fontSize: 19,
                  color: AppColors.black,
                ),
              ),
              subtitle: Text(
                'Senior UI/UX Designer at Google',
                style: UrbanistTextStyles().bold(
                  fontSize: 16,
                  color: AppColors.greyScale.grey500,
                ),
              ),
              trailing: Icon(IconlyLight.chat, size: 23, color: AppColors.blue),
            ),
          ),
          Text(
            'About Course',
            style: UrbanistTextStyles().bold(
              fontSize: 20,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.course.description,
            style: UrbanistTextStyles().bold(
              fontSize: 16,
              color: AppColors.greyScale.grey500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Tools',
            style: UrbanistTextStyles().bold(
              fontSize: 20,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset('assets/images/figma_logo.png'),
              const SizedBox(width: 5),
              Text(
                "Figma",
                style: UrbanistTextStyles().semiBold(
                  fontSize: 16,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
