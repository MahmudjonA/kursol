import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:lms_system/core/route/rout_generator.dart';
import 'package:lms_system/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:lms_system/features/auth/presentation/bloc/auth_event.dart';
import 'package:lms_system/features/auth/presentation/bloc/log_in_user/log_in_user_bloc.dart';
import 'package:lms_system/features/auth/presentation/bloc/log_in_user/log_in_user_state.dart';
import 'package:lms_system/features/auth/presentation/pages/forget_reset_password/pages/forgot_password.dart';
import 'package:lms_system/features/auth/presentation/pages/sign_up/sign_up_page.dart';
import 'package:lms_system/features/main_page.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/sizes/sizes.dart';
import '../../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../../core/common/widgets/buttons/default_button_wg.dart';
import '../../../../../core/common/widgets/textfield/custom_text_field_wg.dart';
import '../../../../../core/di/service_locator.dart';
import '../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../core/text_styles/app_tex_style.dart';
import '../../../../../core/utils/logger.dart';
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
  bool _obscureText = true;
  final authLocalDataSource = sl<AuthLocalDataSource>();

  @override
  void initState() {
    super.initState();

    _passwordFocusNode.addListener(() {
      setState(() {
        _isFocusedPassword = _passwordFocusNode.hasFocus;
      });
    });

    _emailFocusNode.addListener(() {
      setState(() {
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

  void signInUser() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill in all fields"),
          backgroundColor: AppColors.red,
        ),
      );
      return;
    }

    BlocProvider.of<LogInUserBloc>(
      context,
    ).add(LoginUser(email: email, password: password));
  }

  void saveRememberMe(String email, String password) {
    authLocalDataSource
        .saveRememberMe(email, password)
        .then((_) {
          LoggerService.info("Remember Me saved : $email - $password");
        })
        .catchError((error) {
          LoggerService.error("Error saving Remember Me: $error");
        });
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
                  BlocConsumer<LogInUserBloc, LogInUserState>(
                    listener: (context, state) {
                      if (state is LogInUserSuccess) {
                        saveRememberMe(
                          _emailController.text,
                          _passwordController.text,
                        );
                        AppRoute.go(MainPage());
                      } else if (state is LogInUserError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            backgroundColor: AppColors.red,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is LogInUserLoading) {
                        return Center(
                          child: SpinKitFadingCircle(
                            color: AppColors.primary(),
                            size: 60.0,
                          ),
                        );
                      } else {
                        return DefaultButtonWg(
                          title: "Sign In",
                          onPressed: signInUser,
                        );
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      AppRoute.go(ForgotPassword());
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
                  AppRoute.replace(SignUpPage());
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
