import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/responsiveness/app_responsive.dart';
import '../../../../core/text_styles/app_tex_style.dart';

class ProfileSettingRowWg extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? secondaryText;
  final VoidCallback onPressed;

  const ProfileSettingRowWg({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
    this.secondaryText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: icon != null ? appW(20) : 0,
          children: [
            icon != null
                ? Icon(icon, size: appH(28), color: AppColors.greyScale.grey900)
                : SizedBox.shrink(),
            Text(
              title,
              style: AppTextStyles.urbanist.semiBold(
                color: AppColors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Row(
          spacing: appW(20),
          children: [
            Text(
              secondaryText ?? "",
              style: AppTextStyles.urbanist.semiBold(
                color: AppColors.black,
                fontSize: 18,
              ),
            ),
            IconButton(
              onPressed: onPressed,
              icon: Icon(IconlyLight.arrow_right_2),
            ),
          ],
        ),
      ],
    );
  }
}
