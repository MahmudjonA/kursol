import 'package:lms_system/features/home/domain/entities/courses.dart';

class WishlistResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Course> results;

  WishlistResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });
}
