import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/sizes/sizes.dart';
import '../../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../../core/common/widgets/buttons/default_button_wg.dart';
import '../../../../../core/common/widgets/textfield/custom_text_field_wg.dart';
import '../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../core/route/rout_names.dart';
import '../../../../../core/text_styles/app_tex_style.dart';
import '../../widgets/auth_checkbox_wg.dart';
import '../../widgets/auth_or_continue_with_wg.dart';
import '../../widgets/auth_sign_in_up_choice_wg.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  bool _isFocusedEmail = false;
  bool _isFocusedPassword = false;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() {
      setState(() {
        _isFocusedPassword = _passwordFocusNode.hasFocus;
        _isFocusedEmail = _emailFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ActionAppBarWg(
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: scaffoldPadding48,
          child: Column(
            spacing: appH(48),
            children: [
              Text(
                "Login to your account",
                maxLines: 2,
                textAlign: TextAlign.left,
                style: AppTextStyles.urbanist.bold(
                  color: AppColors.greyScale.grey900,
                  fontSize: 48,
                ),
              ),
              Column(
                spacing: appH(24),
                children: [
                  CustomTextFieldWg(
                    isFocused: _isFocusedEmail,
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    prefixIcon: IconlyBold.message,
                    hintText: "Email",
                    onTap: () {
                      setState(() {
                        _isFocusedEmail = true;
                      });
                    },
                  ),
                  CustomTextFieldWg(
                    isFocused: _isFocusedPassword,
                    obscureText: true,
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    prefixIcon: IconlyBold.lock,
                    hintText: "Password",
                    trailingWidget: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        IconlyBold.hide,
                        size: appH(20),
                        color:
                            _isFocusedPassword
                                ? AppColors.primary()
                                : AppColors.greyScale.grey500,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _isFocusedPassword = true;
                      });
                    },
                  ),
                  AuthCheckboxWg(
                    rememberMe: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                  DefaultButtonWg(
                    title: "Sign In",
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RouteNames.main);
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      // context.go(RoutePaths.forgotPassword);
                      Navigator.pushNamed(context, RouteNames.forgotPassword);
                    },
                    child: Text(
                      "Forgot password?",
                      style: AppTextStyles.urbanist.semiBold(
                        color: AppColors.primary.blue500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              AuthOrContinueWithWg(
                onTapFacebook: () {},
                onTapGoogle: () {},
                onTapApple: () {},
              ),
              AuthSignInUpChoiceWg(
                text: "Don't have an account?",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, RouteNames.signUp);
                },
                buttonText: "Sign Up",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
