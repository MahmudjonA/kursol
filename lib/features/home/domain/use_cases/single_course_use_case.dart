import 'package:lms_system/features/home/domain/repositories/home_repo.dart';

import '../entities/courses.dart';

class SingleCourseUseCase {
  final HomeRepo courseRepository;

  SingleCourseUseCase(this.courseRepository);

  Future<Course> call({required int courseId}) async {
    return await courseRepository.getSingleCourses(id: courseId);
  }
}
