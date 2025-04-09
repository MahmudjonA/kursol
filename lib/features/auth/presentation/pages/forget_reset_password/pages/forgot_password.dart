import 'package:flutter/material.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../../../core/common/widgets/buttons/default_button_wg.dart';
import '../../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../../core/route/rout_names.dart';
import '../../../../../../core/text_styles/app_tex_style.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          // context.go(RoutePaths.signin);
          Navigator.pushNamed(context, RouteNames.signIn);
        },
        titleText: "Forgot Password",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 33),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: appH(24),
            children: [
              Image.asset(
                "assets/images/forgot_password.png",
                height: appH(250),
                width: appW(276),
              ),
              Text(
                "Select which contact method you want to use to reset your password",
                textAlign: TextAlign.left,
                style: AppTextStyles.urbanist.medium(
                  color: AppColors.greyScale.grey900,
                  fontSize: 18,
                ),
              ),
              _buildOption(
                index: 0,
                icon: Icons.message,
                title: "via SMS",
                subtitle: "+1 111 ******99",
              ),
              _buildOption(
                index: 1,
                icon: Icons.email,
                title: "via Email",
                subtitle: "and***ley@yourdomain.com",
              ),
              DefaultButtonWg(
                title: "Continue",
                onPressed: () {
                  // context.go(RoutePaths.sendCodeForgotPassword);
                  Navigator.pushNamed(context, RouteNames.sendCode);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption({
    required int index,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isSelected
                    ? AppColors.primary.blue400
                    : AppColors.greyScale.grey200,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            Container(
              width: appW(80),
              height: appH(80),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColors.primary.blue100,
              ),
              child: Center(
                child: Icon(icon, size: 26, color: AppColors.primary.blue400),
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.urbanist.medium(
                    color: AppColors.greyScale.grey600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  subtitle,
                  style: AppTextStyles.urbanist.bold(
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
