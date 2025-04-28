import 'package:lms_system/features/home/domain/entities/category_responce.dart';
import 'package:lms_system/features/home/domain/entities/courses.dart';
import 'package:lms_system/features/home/domain/entities/response_mentor.dart';

abstract class HomeRepo {
  //! Courses
  Future<List<Course>> getPopularCourses({required int limit});

  Future<Course> getSingleCourses({required int id});

  //! Category
  Future<CategoryResponse> getCategories({required int limit});

  //! Mentors
  Future<ResponseMentor> getTopMentors({required int limit});

  Future<ResponseMentor> getMentors({required int limit});
}

