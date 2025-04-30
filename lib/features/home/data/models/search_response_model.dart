import 'package:lms_system/features/home/data/models/course_model.dart';
import 'package:lms_system/features/home/data/models/mentor_model.dart';
import 'package:lms_system/features/home/domain/entities/search_response.dart';

class SearchResponseModel extends SearchResponse {
  SearchResponseModel({required super.courses, required super.mentors});

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchResponseModel(
      courses:
          (json['courses'] as List<dynamic>?)
              ?.map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      mentors:
          (json['mentors'] as List<dynamic>?)
              ?.map((e) => MentorsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
