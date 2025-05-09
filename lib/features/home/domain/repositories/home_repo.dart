import 'package:lms_system/features/home/domain/entities/category_responce.dart';
import 'package:lms_system/features/home/domain/entities/course_response.dart';
import 'package:lms_system/features/home/domain/entities/courses.dart';
import 'package:lms_system/features/home/domain/entities/response_mentor.dart';
import 'package:lms_system/features/home/domain/entities/response_wishlist.dart';
import 'package:lms_system/features/home/domain/entities/search_response.dart';

import '../entities/lessons_response.dart';
import '../entities/notification_response.dart';

abstract class HomeRepo {
  //! Courses
  Future<CourseResponse> getPopularCourses({
    required int limit,
    required int? categoryId,
  });

  Future<Course> getSingleCourses({required int id});

  //! Category
  Future<CategoryResponse> getCategories({required int limit});

  //! Mentors
  Future<ResponseMentor> getTopMentors({required int limit});

  Future<ResponseMentor> getMentors({required int limit});

  //! Search
  Future<SearchResponse> search({required String query});

  //! Wishlist
  Future<WishlistResponse> getWishlist({
    required int limit,
    required int? categoryId,
  });

  Future<void> addToWishlist({required int courseId});

  Future<void> removeFromWishlist({required int courseId});

  //! Notification
  Future<NotificationResponse> getNotifications();

  //! Lessons
  // Future<LessonsResponse> getLessons({required int courseId});
}
