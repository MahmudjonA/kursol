import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:lms_system/core/route/rout_generator.dart';
import 'package:lms_system/features/auth/presentation/bloc/register_user/register_user_bloc.dart';
import 'package:lms_system/features/auth/presentation/bloc/register_user/register_user_state.dart';
import 'package:lms_system/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'package:lms_system/features/auth/presentation/pages/sign_up/sign_up_confirm_email_or_password.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/sizes/sizes.dart';
import '../../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../../core/common/widgets/buttons/default_button_wg.dart';
import '../../../../../core/common/widgets/textfield/custom_text_field_wg.dart';
import '../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../core/text_styles/app_tex_style.dart';
import '../../bloc/auth_event.dart';
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
  final TextEditingController _repeatPassword = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _repeatPasswordFocusNode = FocusNode();
  final FocusNode _emailOrPhoneFocusNode = FocusNode();
  bool _obscureText = true;
  bool _useEmail = true;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() => setState(() {}));
    _emailOrPhoneFocusNode.addListener(() => setState(() {}));
    _repeatPasswordFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _repeatPasswordFocusNode.dispose();
    _emailOrPhoneFocusNode.dispose();
    _repeatPassword.dispose();
    _emailOrPhoneController.dispose();
    super.dispose();
  }

  void _toggleInputMode() {
    setState(() {
      _useEmail = !_useEmail;
      _emailOrPhoneController.clear();
    });
  }

  void registerUser() {
    final emailOrPhone = _emailOrPhoneController.text;
    final password = _passwordController.text;
    final repeatPassword = _repeatPassword.text;

    if (emailOrPhone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter your email or phone number."),
          backgroundColor: AppColors.red,
        ),
      );
      return;
    }

    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter your password."),
          backgroundColor: AppColors.red,
        ),
      );
      return;
    }

    if (repeatPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please repeat your password."),
          backgroundColor: AppColors.red,
        ),
      );
      return;
    }

    if (password != repeatPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords do not match!"),
          backgroundColor: AppColors.red,
        ),
      );
      return;
    }

    context.read<RegisterUserBloc>().add(
      RegisterUser(email: emailOrPhone, password: password),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ActionAppBarWg(
        onBackPressed: () {
          AppRoute.close();
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
                  CustomTextFieldWg(
                    isFocused: _repeatPasswordFocusNode.hasFocus,
                    obscureText: _obscureText,
                    controller: _repeatPassword,
                    focusNode: _repeatPasswordFocusNode,
                    prefixIcon: IconlyBold.lock,
                    hintText: "Repeat Password",
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
                            _repeatPasswordFocusNode.hasFocus
                                ? AppColors.primary()
                                : AppColors.greyScale.grey500,
                      ),
                    ),
                  ),

                  BlocConsumer<RegisterUserBloc, RegisterUserState>(
                    listener: (context, state) {
                      if (state is RegisterUserSuccess) {
                        AppRoute.go(
                          SignUpConfirmEmailOrPassword(
                            userId: state.registerUser.userId,
                            emailOrPhone: _emailOrPhoneController.text,
                            password: _passwordController.text,
                          ),
                        );
                      } else if (state is RegisterUserError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            backgroundColor: AppColors.red,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is RegisterUserLoading) {
                        return Center(
                          child: SpinKitFadingCircle(
                            color: AppColors.primary(),
                            size: 60.0,
                          ),
                        );
                      } else {
                        return DefaultButtonWg(
                          title: "Sign Up",
                          onPressed: registerUser,
                        );
                      }
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
                  AppRoute.replace(SignInPage());
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
