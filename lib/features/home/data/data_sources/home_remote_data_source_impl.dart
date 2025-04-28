import 'package:lms_system/core/common/api_urls.dart';
import 'package:lms_system/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:lms_system/features/home/data/models/category_response_model.dart';
import 'package:lms_system/features/home/data/models/course_model.dart';
import 'package:lms_system/features/home/data/models/response_mentor.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/utils/logger.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioClient dioClient = DioClient();

  @override
  Future<List<CourseModel>> getPopularCourses({required int limit}) async {
    try {
      final response = await dioClient.get("${ApiUrls.popularCourses}$limit");
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info(
          'Popular courses fetched successfully: ${response.data}',
        );
        return (response.data as List)
            .map((json) => CourseModel.fromJson(json))
            .toList();
      } else {
        LoggerService.warning(
          "Failed to fetch popular courses: ${response.statusCode}",
        );
        throw Exception(
          'Failed to fetch popular courses: ${response.statusCode}',
        );
      }
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
    } catch (e) {
      LoggerService.error('Error while fetching categories: $e');
      rethrow;
    }
  }
}
