import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lms_system/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:lms_system/features/auth/data/repositories/auth_repository.dart';
import 'package:lms_system/features/auth/domain/repositories/auth_repo.dart';
import 'package:lms_system/features/auth/domain/use_cases/registration_use_case.dart';

import '../../features/auth/presentation/bloc/register_user/register_user_bloc.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton(() => Dio());

  //! Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: sl()),
  );
  //! Repositories
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepositoryImpl(authRemoteDataSource: sl()),
  );

  //! Use cases
  sl.registerLazySingleton(() => RegisterUserUseCase(sl()));

  //! Bloc
  sl.registerLazySingleton(() => RegisterUserBloc(sl()));
}
