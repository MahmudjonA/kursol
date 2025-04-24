import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lms_system/core/route/rout_generator.dart';
import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/responsiveness/app_responsive.dart';
import '../../../../core/text_styles/app_tex_style.dart';

void showSuccessDialog(BuildContext context, Widget page) {
  showDialog(
    context: context!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: appH(32),
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/congratulations.png"),
              Text(
                "Congratulations!",
                style: AppTextStyles.urbanist.bold(
                  color: AppColors.primary.blue500,
                  fontSize: 24,
                ),
              ),
              Text(
                "Account is ready to use.",
                textAlign: TextAlign.center,
                style: AppTextStyles.urbanist.regular(
                  color: AppColors.greyScale.grey900,
                  fontSize: 16,
                ),
              ),
              SpinKitFadingCircle(color: AppColors.primary.blue500, size: 60.0),
            ],
          ),
        ),
      );
    },
  );

  Future.delayed(Duration(seconds: 3), () {
    AppRoute.go(page);
  });
}
