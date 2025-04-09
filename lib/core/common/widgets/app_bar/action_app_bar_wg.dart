import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../responsiveness/app_responsive.dart';
import '../../../text_styles/app_tex_style.dart';
import '../../colors/app_colors.dart';

class ActionAppBarWg extends StatelessWidget implements PreferredSizeWidget {
  const ActionAppBarWg({
    super.key,
    this.titleText,
    required this.onBackPressed,
    this.actions,
  });

  final String? titleText;
  final VoidCallback onBackPressed;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      title: Text(
        titleText ?? "",
        style: AppTextStyles.urbanist.bold(
          color: AppColors.black,
          fontSize: 24,
        ),
      ),
      leading: IconButton(
        onPressed: onBackPressed,
        icon: Icon(
          IconlyLight.arrow_left,
          size: appH(28),
          color: AppColors.black,
        ),
      ),
      actions: actions,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: AppColors.white,

        ),
      ),
    );
  }
}
