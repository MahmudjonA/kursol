import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lms_system/core/route/rout_generator.dart';
import 'package:lms_system/features/profile/presentation/pages/edit_profile/edit_profile_page.dart';
import 'package:lms_system/features/profile/presentation/pages/help_center/profile_help_center_page.dart';
import 'package:lms_system/features/profile/presentation/pages/invite_friends/profile_invite_friends_page.dart';
import 'package:lms_system/features/profile/presentation/pages/language/profile_language_page.dart';
import 'package:lms_system/features/profile/presentation/pages/notification/profile_notification_page.dart';
import 'package:lms_system/features/profile/presentation/pages/payment/profile_payment_page.dart';
import 'package:lms_system/features/profile/presentation/pages/privacy_policy/profile_policy_page.dart';
import 'package:lms_system/features/profile/presentation/pages/security/profile_security_page.dart';
import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/common/constants/app_string.dart';
import '../../../../core/common/widgets/default_app_bar_wg.dart';
import '../../../../core/responsiveness/app_responsive.dart';
import '../../../../core/text_styles/app_tex_style.dart';
import '../widgets/logout_bottom_sheet_wg.dart';
import '../widgets/profile_info_wg.dart';
import '../widgets/profile_setting_row_wg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: DefaultAppBarWg(
        titleText: AppStrings.profile,
        onMorePressed: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(24), vertical: appH(12)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: appH(20),
            children: [
              ProfileInfoWg(
                onEdit: () {
                  AppRoute.go(EditProfilePage());
                },
                name: "Iftixor Rustamov",
                gmail: "iftixorrustamovv@gmail.com",
                image: "assets/images/profile.png",
              ),
              Divider(height: 1, color: AppColors.greyScale.grey200),
              // * Edit Profile
              ProfileSettingRowWg(
                icon: IconlyLight.profile,
                title: AppStrings.editProfile,
                onPressed: () {
                  AppRoute.go(EditProfilePage());
                },
              ),
              // * Notification
              ProfileSettingRowWg(
                icon: IconlyLight.notification,
                title: AppStrings.notification,
                onPressed: () {
                  AppRoute.go(ProfileNotificationPage());
                },
              ),
              // * Payment
              ProfileSettingRowWg(
                icon: IconlyLight.wallet,
                title: AppStrings.payment,
                onPressed: () {
                  AppRoute.go(ProfilePaymentPage());

                },
              ),
              // * Security
              ProfileSettingRowWg(
                icon: IconlyLight.shield_done,
                title: AppStrings.security,
                onPressed: () {
                  AppRoute.go(ProfileSecurityPage());

                },
              ),
              // * Language
              ProfileSettingRowWg(
                icon: Icons.language, //
                title: AppStrings.language,
                secondaryText: "English (US)",
                onPressed: () {
                  // context.pushNamed(RouteNames.profileLanguage);
                  AppRoute.go(ProfileLanguagePage());

                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: appW(20),
                    children: [
                      Icon(
                        IconlyLight.show,
                        size: appH(28),
                        color: AppColors.greyScale.grey900,
                      ),
                      Text(
                        AppStrings.darkMode,
                        style: AppTextStyles.urbanist.semiBold(
                          color: AppColors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Switch.adaptive(value: false, onChanged: (val) {}),
                ],
              ),
              // * Privacy Policy
              ProfileSettingRowWg(
                icon: IconlyLight.lock,
                title: AppStrings.privacyPolicy,
                onPressed: () {
                  // context.pushNamed(RouteNames.profilePrivacy);
                  AppRoute.go(ProfilePrivacyPage());
                },
              ),
              // * Help Center
              ProfileSettingRowWg(
                icon: IconlyLight.info_square,
                title: AppStrings.helpCenter,
                onPressed: () {
                  // context.pushNamed(RouteNames.profileHelpCenter);
                  AppRoute.go(ProfileHelpCenterPage());
                },
              ),
              // * Invite Friends
              ProfileSettingRowWg(
                icon: IconlyLight.user_1,
                title: AppStrings.inviteFriends,
                onPressed: () {
                  // context.pushNamed(RouteNames.profileInviteFriends);
                  AppRoute.go(ProfileInviteFriendsPage());
                },
              ),
              InkWell(
                onTap: () => showLogoutModal(context),
                child: Row(
                  spacing: appW(20),
                  children: [
                    Icon(
                      IconlyLight.logout,
                      size: appH(28),
                      color: AppColors.red,
                    ),
                    Text(
                      AppStrings.logOut,
                      style: AppTextStyles.urbanist.semiBold(
                        color: AppColors.red,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
