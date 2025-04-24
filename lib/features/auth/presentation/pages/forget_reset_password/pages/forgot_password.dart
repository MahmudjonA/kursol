import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:lms_system/core/route/rout_generator.dart';
import 'package:lms_system/features/auth/presentation/bloc/auth_event.dart';
import 'package:lms_system/features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:lms_system/features/auth/presentation/bloc/reset_password/reset_password_state.dart';
import 'package:lms_system/features/auth/presentation/pages/forget_reset_password/pages/send_code_forgot_password.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../../../core/common/widgets/buttons/default_button_wg.dart';
import '../../../../../../core/common/widgets/textfield/custom_text_field_wg.dart';
import '../../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../../core/text_styles/app_tex_style.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  bool _isFocusedEmail = false;

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      setState(() {
        _isFocusedEmail = _emailFocusNode.hasFocus;
      });
    });
  }

  void resetPassword() {
    String email = _emailController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter your email"),
          backgroundColor: AppColors.red,
        ),
      );
      return;
    }
    BlocProvider.of<ResetPasswordBloc>(
      context,
    ).add(ResetPasswordEvent(emailOrPhone: email));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          AppRoute.close();
        },
        titleText: "Forgot Password",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 33),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: appH(60),
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
              BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
                listener: (context, state) {
                  if (state is ResetPasswordSuccess) {
                    AppRoute.go(
                      SendCodeForgotPassword(
                        emailOrPhone: _emailController.text.trim(),
                        userId: state.response.userId,
                      ),
                    );
                  } else if (state is ResetPasswordError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: AppColors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ResetPasswordLoading) {
                    return Center(
                      child: SpinKitFadingCircle(
                        color: AppColors.primary(),
                        size: 60.0,
                      ),
                    );
                  } else {
                    return DefaultButtonWg(
                      title: "Continue",
                      onPressed: resetPassword,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
