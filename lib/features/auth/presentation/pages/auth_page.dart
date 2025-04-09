import 'package:flutter/material.dart';
import 'package:lms_system/core/route/rout_names.dart';
import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/common/sizes/sizes.dart';
import '../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../core/common/widgets/buttons/default_button_wg.dart';
import '../../../../core/responsiveness/app_responsive.dart';
import '../../../../core/text_styles/app_tex_style.dart';
import '../widgets/auth_sign_in_button_wg.dart';
import '../widgets/auth_sign_in_up_choice_wg.dart';

final _divider = Expanded(child: Divider(color: AppColors.greyScale.grey200));

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ActionAppBarWg(onBackPressed: () {}),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: scaffoldPadding48,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Assets.images.auth.image(),
            Image.asset("assets/images/auth.png"),
            Text(
              "Let's you in",
              textAlign: TextAlign.center,
              style: AppTextStyles.urbanist.bold(
                color: AppColors.greyScale.grey900,
                fontSize: 48,
              ),
            ),
            // * Buttons
            Column(
              spacing: appH(24),
              children: [
                AuthSignInButtonWg(
                  image: Image.asset(
                    "assets/images/facebook.png",
                    height: appH(24),
                    width: appW(24),
                  ),
                  text: "Continue with Facebook",
                  onTap: () {},
                ),
                AuthSignInButtonWg(
                  image: Image.asset(
                    "assets/images/google.png",
                    height: appH(24),
                    width: appW(24),
                  ),
                  text: "Continue with Google",
                  onTap: () {},
                ),
                AuthSignInButtonWg(
                  image: Image.asset(
                    "assets/images/apple.png",
                    height: appH(24),
                    width: appW(24),
                  ),
                  text: "Continue with Apple",
                  onTap: () {},
                ),
                Row(
                  spacing: appW(16),
                  children: [
                    _divider,
                    Text(
                      "or",
                      style: AppTextStyles.urbanist.semiBold(
                        color: AppColors.greyScale.grey700,
                        fontSize: 18,
                      ),
                    ),
                    _divider,
                  ],
                ),
                DefaultButtonWg(
                  title: "Sign in with password",
                  onPressed: () {
                    // context.go(RoutePaths.signin);
                    Navigator.pushNamed(context, RouteNames.signIn);
                  },
                ),
              ],
            ),
            AuthSignInUpChoiceWg(
              text: "Don't have an account?",
              onPressed: () {
                // context.go(RoutePaths.signup);
                Navigator.pushNamed(context, RouteNames.signUp);
              },
              buttonText: "Sign up",
            ),
          ],
        ),
      ),
    );
  }
}
