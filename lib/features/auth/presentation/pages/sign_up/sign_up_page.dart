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

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailOrPhoneFocusNode = FocusNode();
  bool _rememberMe = false;
  bool _obscureText = true;
  bool _useEmail = true;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() => setState(() {}));
    _emailOrPhoneFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailOrPhoneFocusNode.dispose();
    _emailOrPhoneController.dispose();
    super.dispose();
  }

  void _toggleInputMode() {
    setState(() {
      _useEmail = !_useEmail;
      _emailOrPhoneController.clear(); // Clear input when switching
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ActionAppBarWg(
        onBackPressed: () {
          // context.go(RoutePaths.register_user);
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: scaffoldPadding24,
          child: Column(
            spacing: appH(20),
            children: [
              Text(
                "Create an account",
                maxLines: 2,
                textAlign: TextAlign.left,
                style: AppTextStyles.urbanist.bold(
                  color: AppColors.greyScale.grey900,
                  fontSize: 48,
                ),
              ),
              Column(
                spacing: appH(16),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: appH(10),
                    children: [
                      CustomTextFieldWg(
                        isFocused: _emailOrPhoneFocusNode.hasFocus,
                        controller: _emailOrPhoneController,
                        focusNode: _emailOrPhoneFocusNode,
                        prefixIcon:
                            _useEmail ? IconlyBold.message : IconlyBold.call,
                        hintText: _useEmail ? "Email" : "Phone number",
                      ),
                      GestureDetector(
                        onTap: _toggleInputMode,
                        child: Text(
                          _useEmail ? 'Use phone instead' : 'Use email instead',
                          style: AppTextStyles.urbanist.semiBold(
                            color: AppColors.primary(),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomTextFieldWg(
                    isFocused: _passwordFocusNode.hasFocus,
                    obscureText: _obscureText,
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    prefixIcon: IconlyBold.lock,
                    hintText: "Password",
                    trailingWidget: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? IconlyBold.hide : IconlyBold.show,
                        size: appH(20),
                        color:
                            _passwordFocusNode.hasFocus
                                ? AppColors.primary()
                                : AppColors.greyScale.grey500,
                      ),
                    ),
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
                    title: "Sign Up",
                    onPressed: () {
                      // context.go(RoutePaths.home);
                      Navigator.pushNamed(context, RouteNames.fillYourProfile);
                    },
                  ),
                ],
              ),
              AuthOrContinueWithWg(
                onTapFacebook: () {},
                onTapGoogle: () {},
                onTapApple: () {},
              ),
              AuthSignInUpChoiceWg(
                text: "Already have an account?",
                onPressed: () {
                  // context.go(RoutePaths.signup);
                  Navigator.pushReplacementNamed(context, RouteNames.signIn);
                },
                buttonText: "Sign In",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
