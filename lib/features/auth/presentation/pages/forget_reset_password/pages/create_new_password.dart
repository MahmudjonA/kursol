import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:lms_system/core/route/rout_generator.dart';
import 'package:lms_system/features/auth/presentation/bloc/reset_new_password/reset_new_password_bloc.dart';
import 'package:lms_system/features/auth/presentation/bloc/reset_new_password/reset_new_password_state.dart';
import 'package:lms_system/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../../../core/common/widgets/buttons/default_button_wg.dart';
import '../../../../../../core/common/widgets/textfield/custom_text_field_wg.dart';
import '../../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../../core/text_styles/app_tex_style.dart';
import '../../../bloc/auth_event.dart';
import '../../../widgets/show_succes_dialog.dart';

class CreateNewPassword extends StatefulWidget {
  final String token;

  const CreateNewPassword({super.key, required this.token});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPassword = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _repeatPasswordFocusNode = FocusNode();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() => setState(() {}));
    _repeatPasswordFocusNode.addListener(() => setState(() {}));
  }

  void newPassword() {
    String password = _passwordController.text.trim();
    String repeatPassword = _repeatPassword.text.trim();

    if (password.isEmpty || repeatPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill in all fields"),
          backgroundColor: AppColors.red,
        ),
      );
      return;
    }

    if (password != repeatPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords do not match"),
          backgroundColor: AppColors.red,
        ),
      );
      return;
    }

    BlocProvider.of<ResetNewPasswordBloc>(
      context,
    ).add(ResetNewPasswordEvent(newPassword: password, token: widget.token));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          AppRoute.close();
        },
        titleText: "Create New Password",
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 24,
          top: 71,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/create_password.png",
                  width: appW(329),
                  height: appH(250),
                ),
              ),
              SizedBox(height: appH(71)),
              Text(
                'Create Your New Password',
                textAlign: TextAlign.center,
                style: AppTextStyles.urbanist.regular(
                  color: AppColors.greyScale.grey900,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: appH(24)),
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
              SizedBox(height: appH(24)),
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
              SizedBox(height: appH(24)),
              SizedBox(height: appH(24)),
              BlocConsumer<ResetNewPasswordBloc, ResetNewPasswordState>(
                listener: (context, state) {
                  if (state is ResetNewPasswordSuccess) {
                    showSuccessDialog(context, SignInPage());
                  } else if (state is ResetNewPasswordError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: AppColors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ResetNewPasswordLoading) {
                    return Center(
                      child: SpinKitFadingCircle(
                        color: AppColors.primary(),
                        size: 60.0,
                      ),
                    );
                  } else {
                    return DefaultButtonWg(
                      title: "Continue",
                      onPressed: newPassword,
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
