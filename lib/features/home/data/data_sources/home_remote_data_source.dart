import 'package:lms_system/features/home/data/models/courses_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<CoursesResponseModel> getCourses({required int limit});
}
