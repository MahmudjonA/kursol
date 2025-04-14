import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../responsiveness/app_responsive.dart';
import '../../text_styles/app_tex_style.dart';
import '../colors/app_colors.dart';

class DefaultAppBarWg extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBarWg({
    super.key,
    required this.titleText,
    this.onSearchPressed,
    required this.onMorePressed,
  });

  final String titleText;
  final VoidCallback? onSearchPressed;
  final VoidCallback onMorePressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.white,
      elevation: 0.5,
      centerTitle: false,
      leading: Image.asset(
        "assets/images/logo.png",
        width: appW(40),
        height: appH(40),
      ),
      title: Text(
        titleText,
        style: AppTextStyles.urbanist.bold(
          color: AppColors.black,
          fontSize: 24,
        ),
      ),
      actions: [
        if (onSearchPressed != null)
          IconButton(
            onPressed: onSearchPressed,
            icon: Icon(
              IconlyLight.search,
              size: appH(28),
              color: AppColors.black,
            ),
          ),
        IconButton(
          onPressed: onMorePressed,
          icon: Icon(
            IconlyLight.more_circle,
            size: appH(28),
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
