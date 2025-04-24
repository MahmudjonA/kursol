import 'package:lms_system/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:lms_system/features/home/domain/repositories/home_repo.dart';
import '../models/courses_response_model.dart';

class HomeRepositoryImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<CoursesResponseModel> getCourses({required int limit}) {
    return homeRemoteDataSource.getCourses(limit: limit);
  }
}
