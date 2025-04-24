class HomeEvent {
  const HomeEvent();
}

class GetCourses extends HomeEvent {
  final int limit;

  GetCourses({required this.limit});
}
