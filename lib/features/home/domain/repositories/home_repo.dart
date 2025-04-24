import 'package:lms_system/features/home/domain/entities/course_response.dart';


abstract class HomeRepo {
  Future<CourseResponse> getCourses({required int limit});
}
