import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_system/features/auth/presentation/bloc/confirm_email/confirm_email_bloc.dart';
import 'package:lms_system/features/auth/presentation/bloc/log_in_user/log_in_user_bloc.dart';
import 'package:lms_system/features/auth/presentation/bloc/log_out/log_out_bloc.dart';
import 'package:lms_system/features/auth/presentation/bloc/register_user/register_user_bloc.dart';
import 'package:lms_system/features/auth/presentation/bloc/reset_new_password/reset_new_password_bloc.dart';
import 'package:lms_system/features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:lms_system/features/home/presentation/bloc/category/category_bloc.dart';
import 'package:lms_system/features/home/presentation/bloc/courses/courses_bloc.dart';
import 'core/di/service_locator.dart';
import 'features/home/presentation/bloc/mentors/mentors_bloc.dart';
import 'features/home/presentation/bloc/single_course/single_course_bloc.dart';
import 'features/home/presentation/bloc/top_mentors/top_mentors_bloc.dart';
import 'features/home/presentation/bloc/wishlist/wishlist_bloc.dart';

class MyBlocProvider extends StatelessWidget {
  const MyBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //* Auth
        BlocProvider<RegisterUserBloc>(
          create: (context) => sl<RegisterUserBloc>(),
        ),
        BlocProvider<ConfirmEmailBloc>(
          create: (context) => sl<ConfirmEmailBloc>(),
        ),
        BlocProvider<LogInUserBloc>(create: (context) => sl<LogInUserBloc>()),
        BlocProvider<ResetPasswordBloc>(
          create: (context) => sl<ResetPasswordBloc>(),
        ),
        BlocProvider<ResetNewPasswordBloc>(
          create: (context) => sl<ResetNewPasswordBloc>(),
        ),
        BlocProvider<LogoutUserBloc>(create: (context) => sl<LogoutUserBloc>()),
        // * Home
        BlocProvider<CourseBloc>(create: (context) => sl<CourseBloc>()),
        BlocProvider<SingleCourseBloc>(
          create: (context) => sl<SingleCourseBloc>(),
        ),
        BlocProvider<TopMentorsBloc>(create: (context) => sl<TopMentorsBloc>()),
        BlocProvider<MentorBloc>(create: (context) => sl<MentorBloc>()),
        BlocProvider<CategoryBloc>(create: (context) => sl<CategoryBloc>()),
        BlocProvider<WishlistBloc>(create: (context) => sl<WishlistBloc>()),
      ],
      child: child,
    );
  }
}