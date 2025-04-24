import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lms_system/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:lms_system/features/auth/data/repositories/auth_repository.dart';
import 'package:lms_system/features/auth/domain/repositories/auth_repo.dart';
import 'package:lms_system/features/auth/domain/use_cases/registration_use_case.dart';
import 'package:lms_system/features/home/data/data_sources/home_remote_data_source.dart';
import '../../features/auth/data/data_sources/local/auth_local_data_source.dart';
import '../../features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import '../../features/auth/domain/use_cases/confirm_use_case.dart';
import '../../features/auth/domain/use_cases/log_in_user_use_case.dart';
import '../../features/auth/domain/use_cases/reset_new_password.dart';
import '../../features/auth/domain/use_cases/reset_password_use_case.dart';
import '../../features/auth/presentation/bloc/confirm_email/confirm_email_bloc.dart';
import '../../features/auth/presentation/bloc/log_in_user/log_in_user_bloc.dart';
import '../../features/auth/presentation/bloc/register_user/register_user_bloc.dart';
import '../../features/auth/presentation/bloc/reset_new_password/reset_new_password_bloc.dart';
import '../../features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';
import '../../features/home/data/data_sources/home_remote_data_source_impl.dart';
import '../../features/home/data/repositories/home_repository.dart';
import '../../features/home/domain/repositories/home_repo.dart';
import '../../features/home/domain/use_cases/courses_use_case.dart';
import '../../features/home/presentation/bloc/courses/courses_bloc.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton(() => Dio());
  await Hive.initFlutter();

  //! Hive
  final authBox = await Hive.openBox('authBox');
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(authBox),
  );

  //! Data sources
  // * Auth
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  // * Home
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );

  //! Repositories
  // * Auth
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepositoryImpl(authRemoteDataSource: sl()),
  );

  // * Home
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepositoryImpl(homeRemoteDataSource: sl()),
  );
  //! Use cases
  // * Auth
  sl.registerLazySingleton(() => RegisterUserUseCase(sl()));
  sl.registerLazySingleton(() => ConfirmUseCase(sl()));
  sl.registerLazySingleton(() => LogInUserUseCase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => ResetNewPasswordUseCase(sl()));
  // * Home
  sl.registerLazySingleton(() => CoursesUseCase(sl()));

  //! Bloc
  // * Auth
  sl.registerLazySingleton(() => RegisterUserBloc(sl()));
  sl.registerLazySingleton(() => ConfirmEmailBloc(sl()));
  sl.registerLazySingleton(() => LogInUserBloc(sl()));
  sl.registerLazySingleton(() => ResetPasswordBloc(sl()));
  sl.registerLazySingleton(() => ResetNewPasswordBloc(sl()));
  // * Home
  sl.registerLazySingleton(() => CourseBloc(sl()));
}
