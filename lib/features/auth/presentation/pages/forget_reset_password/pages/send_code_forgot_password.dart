import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lms_system/core/route/rout_generator.dart';
import 'package:lms_system/features/auth/presentation/pages/forget_reset_password/pages/create_new_password.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../../../core/common/widgets/buttons/default_button_wg.dart';
import '../../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../../core/text_styles/app_tex_style.dart';
import '../../../bloc/auth_event.dart';
import '../../../bloc/confirm_email/confirm_email_bloc.dart';
import '../../../bloc/confirm_email/confirm_email_state.dart';

class SendCodeForgotPassword extends StatefulWidget {
  final String emailOrPhone;
  final int userId;

  const SendCodeForgotPassword({
    super.key,
    required this.emailOrPhone,
    required this.userId,
  });

  @override
  State<SendCodeForgotPassword> createState() => _SendCodeForgotPasswordState();
}

class _SendCodeForgotPasswordState extends State<SendCodeForgotPassword> {
  List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onKeyPress(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
  }

  void _onBackspace(int index) {
    if (index > 0 && controllers[index].text.isEmpty) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  void confirmEmail() {
    final code = controllers.map((c) => c.text).join();

    if (code.length == 4) {
      context.read<ConfirmEmailBloc>().add(
        ConfirmEmail(
          userId: widget.userId,
          code: int.tryParse(code) ?? 0,
          isResetPassword: true,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter all 4 digits'),
          backgroundColor: AppColors.red,
        ),
      );
    }
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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: appH(80),
          children: [
            Text(
              'Code has been send to ${widget.emailOrPhone}',
              textAlign: TextAlign.center,
              style: AppTextStyles.urbanist.regular(
                color: AppColors.greyScale.grey900,
                fontSize: 18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return Container(
                  width: appW(83),
                  height: appH(63),
                  decoration: BoxDecoration(
                    color:
                        focusNodes[index].hasFocus
                            ? AppColors.primary.blue100
                            : AppColors.greyScale.grey50,
                    borderRadius: BorderRadius.circular(appH(12)),
                    border: Border.all(
                      color:
                          focusNodes[index].hasFocus
                              ? AppColors.primary.blue500
                              : AppColors.greyScale.grey200,
                      width: 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: AppTextStyles.urbanist.bold(
                      color: AppColors.greyScale.grey900,
                      fontSize: 24,
                    ),
                    decoration: const InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _onKeyPress(value, index);
                        _onBackspace(index);
                      });
                    },
                  ),
                );
              }),
            ),
            Text(
              'Resend code in 55 s',
              textAlign: TextAlign.center,
              style: AppTextStyles.urbanist.regular(
                color: AppColors.greyScale.grey900,
                fontSize: 18,
              ),
            ),
            BlocConsumer<ConfirmEmailBloc, ConfirmEmailState>(
              listener: (context, state) {
                if (state is ConfirmEmailSuccess) {
                  AppRoute.go(
                    CreateNewPassword(token: state.confirmEmail.access),
                  );
                } else if (state is ConfirmEmailError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: AppColors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is ConfirmEmailLoading) {
                  return Center(
                    child: SpinKitFadingCircle(
                      color: AppColors.primary(),
                      size: 60.0,

                    ),
                  );
                } else {
                  return DefaultButtonWg(
                    title: "Verify",
                    onPressed: confirmEmail,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
