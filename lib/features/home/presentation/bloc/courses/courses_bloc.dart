import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_system/features/home/domain/use_cases/courses_use_case.dart';
import 'package:lms_system/features/home/presentation/bloc/home_event.dart';

import 'courses_state.dart';

class CourseBloc extends Bloc<HomeEvent, CourseState> {
  final CoursesUseCase getCoursesUseCase;

  CourseBloc(this.getCoursesUseCase) : super(CourseInitial()) {
    on<GetCourses>(onGetCourses);
  }

  Future<void> onGetCourses(event, emit) async {
    emit(CourseLoading());
    try {
      final courses = await getCoursesUseCase(limit: event.limit);
      emit(CourseLoaded(courses: courses));
    } catch (e) {
      emit(CourseError(message: e.toString()));
    }
  }
}
