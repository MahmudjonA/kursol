import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_system/features/auth/presentation/bloc/register_user/register_user_bloc.dart';
import 'core/di/service_locator.dart';

class MyBlocProvider extends StatelessWidget {
  const MyBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterUserBloc>(
          create: (context) => sl<RegisterUserBloc>(),
        ),
      ],
      child: child,
    );
  }
}
