import 'package:lms_system/features/home/domain/entities/course_response.dart';
import 'package:lms_system/features/home/domain/entities/courses.dart';
import 'package:lms_system/features/home/domain/repositories/home_repo.dart';

class CoursesUseCase {
  final HomeRepo coursesRepository;

  CoursesUseCase(this.coursesRepository);

  Future<List<Course>> call({required int limit}) async {
    return await coursesRepository.getPopularCourses(limit: limit);
  }
}
