import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lms_system/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:lms_system/features/auth/data/repositories/auth_repository.dart';
import 'package:lms_system/features/auth/domain/repositories/auth_repo.dart';
import 'package:lms_system/features/auth/domain/use_cases/registration_use_case.dart';
import 'package:lms_system/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:lms_system/features/home/domain/use_cases/wishlist_use_case.dart';
import '../../features/auth/data/data_sources/local/auth_local_data_source.dart';
import '../../features/auth/data/data_sources/local/auth_local_remote_data_source_impl.dart';
import '../../features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import '../../features/auth/domain/use_cases/confirm_use_case.dart';
import '../../features/auth/domain/use_cases/log_in_user_use_case.dart';
import '../../features/auth/domain/use_cases/log_out_use_case.dart';
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
import '../../features/home/domain/use_cases/category_use_case.dart';
import '../../features/home/domain/use_cases/courses_use_case.dart';
import '../../features/home/domain/use_cases/mentors_use_case.dart';
import '../../features/home/domain/use_cases/single_course_use_case.dart';
import '../../features/home/domain/use_cases/top_mentors_use_case.dart';
import '../../features/home/presentation/bloc/category/category_bloc.dart';
import '../../features/home/presentation/bloc/courses/courses_bloc.dart';
import '../../features/home/presentation/bloc/mentors/mentors_bloc.dart';
import '../../features/home/presentation/bloc/single_course/single_course_bloc.dart';
import '../../features/home/presentation/bloc/top_mentors/top_mentors_bloc.dart';
import '../../features/home/presentation/bloc/wishlist/wishlist_bloc.dart';

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
  sl.registerLazySingleton(() => LogOutUseCase(sl()));

  // * Home
  sl.registerLazySingleton(() => CoursesUseCase(sl()));
  sl.registerLazySingleton(() => SingleCourseUseCase(sl()));
  sl.registerLazySingleton(() => TopMentorsUseCase(sl()));
  sl.registerLazySingleton(() => MentorsUseCase(sl()));
  sl.registerLazySingleton(() => CategoryUseCase(sl()));
  sl.registerLazySingleton(() => WishlistUseCase(sl()));

  //! Bloc
  // * Auth
  sl.registerLazySingleton(() => RegisterUserBloc(sl()));
  sl.registerLazySingleton(() => ConfirmEmailBloc(sl()));
  sl.registerLazySingleton(() => LogInUserBloc(sl()));
  sl.registerLazySingleton(() => ResetPasswordBloc(sl()));
  sl.registerLazySingleton(() => ResetNewPasswordBloc(sl()));
  // * Home
  sl.registerLazySingleton(() => CourseBloc(sl()));
  sl.registerLazySingleton(() => SingleCourseBloc(sl()));
  sl.registerLazySingleton(() => TopMentorsBloc(sl()));
  sl.registerLazySingleton(() => MentorBloc(sl()));
  sl.registerLazySingleton(() => CategoryBloc(sl()));
  sl.registerLazySingleton(() => WishlistBloc(sl()));
}
