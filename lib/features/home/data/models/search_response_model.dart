import 'package:lms_system/features/home/data/models/course_model.dart';
import 'package:lms_system/features/home/data/models/mentor_model.dart';
import 'package:lms_system/features/home/domain/entities/search_response.dart';

class SearchResponseModel extends SearchResponse {
  SearchResponseModel({required super.courses, required super.mentors});

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchResponseModel(
      courses:
          (json['courses'] as List<dynamic>?)
              ?.map(
                (course) =>
                    CourseModel.fromJson(course as Map<String, dynamic>),
              )
              .toList(),
      mentors:
          (json['mentors'] as List<dynamic>?)
              ?.map(
                (mentor) =>
                    MentorsModel.fromJson(mentor as Map<String, dynamic>),
              )
              .toList(),
    );
  }
}
