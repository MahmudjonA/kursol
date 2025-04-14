import 'package:flutter/material.dart';

import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/common/constants/app_string.dart';
import '../../../../core/common/sizes/sizes.dart';
import '../../../../core/responsiveness/app_responsive.dart';
import '../../../../core/text_styles/app_tex_style.dart';

void showLogoutModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    backgroundColor: AppColors.white,
    builder: (context) => Padding(
      padding: scaffoldPadding48,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: appH(20),
        children: [
          Text(
            AppStrings.logOut,
            style: AppTextStyles.urbanist.bold(
              color: AppColors.red,
              fontSize: 24,
            ),
          ),
          Divider(thickness: 1, color: AppColors.greyScale.grey200),
          Text(
            AppStrings.wantToLogOut,
            style: AppTextStyles.urbanist.bold(
              color: AppColors.greyScale.grey800,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: appH(54),
                  child: FilledButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primary.blue100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      AppStrings.cancel,
                      style: AppTextStyles.urbanist.bold(
                        color: AppColors.primary(),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: appW(12)),
              Expanded(
                child: SizedBox(
                  height: appH(54),
                  child: ElevatedButton(
                    onPressed: () {
                      // context.go(RoutePaths.signin);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      AppStrings.yesLogOut,
                      style: AppTextStyles.urbanist.bold(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
