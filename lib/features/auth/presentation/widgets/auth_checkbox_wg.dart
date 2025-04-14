import 'package:flutter/material.dart';
import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/responsiveness/app_responsive.dart';
import '../../../../core/text_styles/app_tex_style.dart';

class AuthCheckboxWg extends StatelessWidget {
  final bool rememberMe;
  final void Function(bool?)? onChanged;

  const AuthCheckboxWg(
      {super.key, required this.rememberMe, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          side: BorderSide(color: AppColors.primary(), width: appW(2)),
          checkColor: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          activeColor: AppColors.primary(),
          value: rememberMe,
          onChanged: onChanged,
        ),
        Text("Remember me",
            style: AppTextStyles.urbanist
                .semiBold(color: AppColors.greyScale.grey900, fontSize: 14)),
      ],
    );
  }
}
