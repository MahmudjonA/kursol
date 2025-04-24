import 'package:lms_system/core/common/api_urls.dart';
import 'package:lms_system/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:lms_system/features/home/data/models/courses_response_model.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/utils/logger.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<CoursesResponseModel> getCourses({required int limit}) async {
    final DioClient dioClient = DioClient();
    try {
      final response = await dioClient.get(ApiUrls.courses);
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('Registration successful: ${response.data}');
        return CoursesResponseModel.fromJson(response.data);
      } else {
        LoggerService.warning("Registration failed: ${response.statusCode}");
        throw Exception('Registration failed: ${response.statusCode}');
      }
    } catch (e) {
      LoggerService.error('Error during user registration: $e');
      rethrow;
    }
  }
}
