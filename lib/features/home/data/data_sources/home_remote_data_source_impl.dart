import 'package:dio/dio.dart';
import 'package:lms_system/core/common/api_urls.dart';
import 'package:lms_system/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:lms_system/features/home/data/models/category_response_model.dart';
import 'package:lms_system/features/home/data/models/course_model.dart';
import 'package:lms_system/features/home/data/models/courses_response_model.dart';
import 'package:lms_system/features/home/data/models/notification_response_model.dart';
import 'package:lms_system/features/home/data/models/response_mentor.dart';
import 'package:lms_system/features/home/data/models/response_wishlist_model.dart';
import 'package:lms_system/features/home/data/models/search_response_model.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/network/dio_exception_handler.dart';
import '../../../../core/utils/logger.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioClient dioClient = DioClient();

  @override
  Future<CoursesResponseModel> getPopularCourses({
    required int limit,
    required int? categoryId,
  }) async {
    try {
      String url = "${ApiUrls.popularCourses}$limit";
      if (categoryId != null) {
        url += "&category_id=$categoryId";
      }
      final response = await dioClient.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info(
          'Popular courses fetched successfully: ${response.data}',
        );
        return CoursesResponseModel.fromJson(response.data);
      } else {
        LoggerService.warning(
          "Failed to fetch popular courses: ${response.statusCode}",
        );
        throw Exception(
          'Failed to fetch popular courses: ${response.statusCode}',
        );
      }
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError); // 🧠 используем утилиту
    } catch (e) {
      LoggerService.error('Error while fetching popular courses: $e');
      rethrow;
    }
  }

  @override
  Future<MentorsResponseModel> getTopMentors({required int limit}) async {
    try {
      final response = await dioClient.get("${ApiUrls.topMentors}$limit");
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info(
          'Top mentors fetched successfully: ${response.data}',
        );
        return MentorsResponseModel.fromJson(response.data);
      } else {
        LoggerService.warning(
          "Failed to fetch top mentors: ${response.statusCode}",
        );
        throw Exception('Failed to fetch top mentors: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError); // 🧠 используем утилиту
    } catch (e) {
      LoggerService.error('Error while fetching top mentors: $e');
      rethrow;
    }
  }

  @override
  Future<MentorsResponseModel> getMentors({required int limit}) async {
    try {
      final response = await dioClient.get("${ApiUrls.mentors}$limit");
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('Mentors fetched successfully: ${response.data}');
        return MentorsResponseModel.fromJson(response.data);
      } else {
        LoggerService.warning(
          "Failed to fetch mentors: ${response.statusCode}",
        );
        throw Exception('Failed to fetch mentors: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError); // 🧠 используем утилиту
    } catch (e) {
      LoggerService.error('Error while fetching mentors: $e');
      rethrow;
    }
  }

  @override
  Future<CourseModel> getSingleCourses({required int id}) async {
    try {
      final response = await dioClient.get("${ApiUrls.courses}$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info(
          'Single course fetched successfully: ${response.data}',
        );
        return CourseModel.fromJson(response.data);
      } else {
        LoggerService.warning(
          "Failed to fetch single course: ${response.statusCode}",
        );
        throw Exception(
          'Failed to fetch single course: ${response.statusCode}',
        );
      }
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError); // 🧠 используем утилиту
    } catch (e) {
      LoggerService.error('Error while fetching single course: $e');
      rethrow;
    }
  }

  @override
  Future<CategoryResponseModel> getCategories({required int limit}) async {
    try {
      final response = await dioClient.get("${ApiUrls.categories}$limit");
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('Categories fetched successfully: ${response.data}');
        return CategoryResponseModel.fromJson(response.data);
      } else {
        LoggerService.warning(
          "Failed to fetch categories: ${response.statusCode}",
        );
        throw Exception('Failed to fetch categories: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError); // 🧠 используем утилиту
    } catch (e) {
      LoggerService.error('Error while fetching categories: $e');
      rethrow;
    }
  }

  @override
  Future<SearchResponseModel> search({required String query}) async {
    try {
      final response = await dioClient.get("${ApiUrls.search}$query");
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info(
          'Search results fetched successfully: ${response.data}',
        );
        return SearchResponseModel.fromJson(response.data);
      } else {
        LoggerService.warning(
          "Failed to fetch search results: ${response.statusCode}",
        );
        throw Exception(
          'Failed to fetch search results: ${response.statusCode}',
        );
      }
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError); // 🧠 используем утилиту
    } catch (e) {
      LoggerService.error('Error while fetching search results: $e');
      rethrow;
    }
  }

  @override
  Future<ResponseWishlistModel> getWishlist({
    required int limit,
    required int? categoryId,
  }) async {
    try {
      String url = "${ApiUrls.myWishlist}$limit";
      if (categoryId != null) {
        url += "&category_id=$categoryId";
      }
      final response = await dioClient.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('Wishlist fetched successfully: ${response.data}');
        return ResponseWishlistModel.fromJson(response.data);
      } else {
        LoggerService.warning(
          "Failed to fetch wishlist: ${response.statusCode}",
        );
        throw Exception('Failed to fetch wishlist: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError); // 🧠 используем утилиту
    } catch (e) {
      LoggerService.error('Error while fetching wishlist: $e');
      rethrow;
    }
  }

  @override
  Future<void> addToWishlist({required int courseId}) async {
    try {
      final response = await dioClient.post(
        ApiUrls.addToWishlist,
        data: {"course_id": courseId},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info(
          'Course added to wishlist successfully: ${response.data}',
        );
      } else {
        LoggerService.warning(
          "Failed to add course to wishlist: ${response.statusCode}",
        );
        throw Exception(
          'Failed to add course to wishlist: ${response.statusCode}',
        );
      }
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError); // 🧠 используем утилиту
    } catch (e) {
      LoggerService.error('Error while adding course to wishlist: $e');
      rethrow;
    }
  }

  @override
  Future<NotificationResponseModel> getNotifications() async {
    try {
      final response = await dioClient.get(ApiUrls.notifications);
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info(
          'Notifications fetched successfully: ${response.data}',
        );
        return NotificationResponseModel.fromJson(response.data);
      } else {
        LoggerService.warning(
          "Failed to fetch notifications: ${response.statusCode}",
        );
        throw Exception(
          'Failed to fetch notifications: ${response.statusCode}',
        );
      }
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError); // 🧠 используем утилиту
    } catch (e) {
      LoggerService.error('Error while fetching notifications: $e');
      rethrow;
    }
  }

  @override
  Future<void> removeFromWishlist({required int courseId}) async {
    try {
      final response = await dioClient.delete(
        "${ApiUrls.removeFromWishlistCourses}$courseId${ApiUrls.removeFromWishlist}",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info(
          'Course removed from wishlist successfully: ${response.data}',
        );
      } else {
        LoggerService.warning(
          "Failed to remove course from wishlist: ${response.statusCode}",
        );
        throw Exception(
          'Failed to remove course from wishlist: ${response.statusCode}',
        );
      }
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError); // 🧠 используем утилиту
    } catch (e) {
      LoggerService.error('Error while removing course from wishlist: $e');
      rethrow;
    }
  }
}
