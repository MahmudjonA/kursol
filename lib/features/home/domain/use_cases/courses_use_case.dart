import 'package:lms_system/features/home/domain/entities/category_responce.dart';
import 'package:lms_system/features/home/domain/entities/course_response.dart';
import 'package:lms_system/features/home/domain/repositories/home_repo.dart';

class CoursesUseCase {
  final HomeRepo coursesRepository;

  CoursesUseCase(this.coursesRepository);

  Future<CourseResponse> call({required int limit}) async {
    return await coursesRepository.getPopularCourses(limit: limit);
  }
}
