import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lms_system/core/route/rout_names.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../../core/text_styles/app_tex_style.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
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
              Image.asset("assets/images/fg_congratulation.png"),
              Text(
                "Congratulations!",
                style: AppTextStyles.urbanist.bold(
                  color: AppColors.primary.blue500,
                  fontSize: 24,
                ),
              ),
              Text(
                "Your account is ready to use. You will be redirected to the Home page in a few seconds..",
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
    Navigator.of(context).pop();
    // context.go(RoutePaths.home);
    Navigator.pushNamed(context, RouteNames.main);
  });
}
