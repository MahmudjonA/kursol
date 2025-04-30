import 'package:lms_system/features/home/domain/entities/courses.dart';
import 'package:lms_system/features/home/domain/entities/mentor.dart';

class SearchResponse {
  final List<Course> courses;
  final List<Mentor> mentors;

  SearchResponse({required this.courses, required this.mentors});
}
