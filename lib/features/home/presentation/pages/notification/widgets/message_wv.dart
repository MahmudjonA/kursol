import 'package:flutter/material.dart';

import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../../core/text_styles/urbanist_text_style.dart';

class MessageWv extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final bool isRead;

  const MessageWv({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.isRead,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap action (e.g., mark as read)
      },
      child: Container(
        margin: EdgeInsets.only(top: appH(24)),
        padding: EdgeInsets.only(left: appW(10)),
        height: appH(112),
        decoration: BoxDecoration(
          color: isRead ? AppColors.white : AppColors.greyScale.grey100, // Different color for read/unread
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Image.asset(imagePath), // Dynamic image path
            SizedBox(width: appW(20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title, // Dynamic title
                  style: UrbanistTextStyles().bold(
                    fontSize: 18,
                    color: isRead ? AppColors.greyScale.grey900 : AppColors.primary.blue500, // Change text color for unread
                  ),
                ),
                Text(
                  subtitle, // Dynamic subtitle
                  style: UrbanistTextStyles().medium(
                    fontSize: 14,
                    color: isRead ? AppColors.greyScale.grey700 : AppColors.primary.blue500, // Subtitle color change
                  ),
                ),
              ],
            ),
            if (!isRead)
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.circle,
                  color: AppColors.primary.blue500,
                  size: 12,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
