import 'package:lms_system/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:lms_system/features/home/data/models/category_response_model.dart';
import 'package:lms_system/features/home/data/models/course_model.dart';
import 'package:lms_system/features/home/data/models/courses_response_model.dart';
import 'package:lms_system/features/home/data/models/response_mentor.dart';
import 'package:lms_system/features/home/data/models/search_response_model.dart';
import 'package:lms_system/features/home/domain/entities/category_responce.dart';
import 'package:lms_system/features/home/domain/entities/response_mentor.dart';
import 'package:lms_system/features/home/domain/entities/response_wishlist.dart';
import 'package:lms_system/features/home/domain/entities/search_response.dart';
import 'package:lms_system/features/home/domain/repositories/home_repo.dart';

class HomeRepositoryImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<CoursesResponseModel> getPopularCourses({required int limit}) async {
    return await homeRemoteDataSource.getPopularCourses(limit: limit);
  }

  @override
  Future<MentorsResponseModel> getTopMentors({required int limit}) async {
    return await homeRemoteDataSource.getMentors(limit: limit);
  }

  @override
  Future<ResponseMentor> getMentors({required int limit}) async {
    return await homeRemoteDataSource.getTopMentors(limit: limit);
  }

  @override
  Future<CourseModel> getSingleCourses({required int id}) async {
    return await homeRemoteDataSource.getSingleCourses(id: id);
  }

  @override
  Future<CategoryResponse> getCategories({required int limit}) async {
    return await homeRemoteDataSource.getCategories(limit: limit);
  }

  @override
  Future<SearchResponseModel> search({required String query}) async {
    return await homeRemoteDataSource.search(query: query);
  }

  @override
  Future<WishlistResponse> getWishlist({
    required int limit,
    required String token,
  }) async {
    return await homeRemoteDataSource.getWishlist(limit: limit, token: token);
  }
}
