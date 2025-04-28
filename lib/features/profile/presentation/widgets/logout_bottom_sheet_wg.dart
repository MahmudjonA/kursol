import 'package:flutter/material.dart';
import 'package:lms_system/core/route/rout_generator.dart';
import 'package:lms_system/core/route/rout_names.dart';
import 'package:lms_system/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:lms_system/features/auth/presentation/pages/auth_page.dart';
import 'package:lms_system/features/auth/presentation/pages/sign_in/sign_in_page.dart';

import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/common/constants/app_string.dart';
import '../../../../core/common/sizes/sizes.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/responsiveness/app_responsive.dart';
import '../../../../core/text_styles/app_tex_style.dart';
import '../../../auth/data/data_sources/local/auth_local_remote_data_source_impl.dart';

void deleteRememberMe() {
  final authLocalDataSource = sl<AuthLocalDataSource>();
  authLocalDataSource.clearAuthToken();
  authLocalDataSource.clearRememberedCredentials();
}

void showLogoutModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    backgroundColor: AppColors.white,
    builder:
        (context) => Padding(
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
                        onPressed: () => AppRoute.close(),
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
                          deleteRememberMe();
                          AppRoute.go(AuthPage());
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
