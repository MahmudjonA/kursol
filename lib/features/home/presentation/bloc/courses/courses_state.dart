import 'package:lms_system/features/home/domain/entities/courses.dart';

abstract class CourseState {
  const CourseState();
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final List<Course> courses;

  const CourseLoaded({required this.courses});
}

class CourseError extends CourseState {
  final String message;

  const CourseError({required this.message});
}
