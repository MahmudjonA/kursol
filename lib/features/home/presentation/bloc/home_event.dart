abstract class HomeEvent {
  const HomeEvent();
}

// ! Courses
class GetPopularCourses extends HomeEvent {
  final int limit;

  GetPopularCourses({required this.limit});
}

class GetSingleCourseEvent extends HomeEvent {
  final int id;

  GetSingleCourseEvent({required this.id});
}

// ! Category
class GetCategoriesEvent extends HomeEvent {
  final int limit;

  GetCategoriesEvent({required this.limit});
}

// ! Mentors
class GetTopMentors extends HomeEvent {
  final int limit;

  GetTopMentors({required this.limit});
}

class GetMentors extends HomeEvent {
  final int limit;

  GetMentors({required this.limit});
}
