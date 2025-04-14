import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lms_system/core/route/rout_names.dart';

import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/text_styles/urbanist_text_style.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

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
              // context.push(RoutePaths.mentorProfile);
              Navigator.pushNamed(context, RouteNames.mentorsProfile);
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Image(
                  image: AssetImage('assets/images/mentor_avatar.png'),
                ),
              ),
              title: Text(
                'Jonathan Williams',
                style: UrbanistTextStyles().bold(
                  fontSize: 22,
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
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip. ",
            style: UrbanistTextStyles().bold(
              fontSize: 16,
              color: AppColors.greyScale.grey500,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip. ",
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
