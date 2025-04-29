class Wishlist {
  final int id;
  final int course;
  final String courseTitle;
  final String? courseImage;
  final String instructor;
  final String user;
  final DateTime createdAt;

  Wishlist({
    required this.id,
    required this.course,
    required this.courseTitle,
    this.courseImage,
    required this.instructor,
    required this.user,
    required this.createdAt,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) {
    return Wishlist(
      id: json['id'],
      course: json['course'],
      courseTitle: json['course_title'],
      courseImage: json['course_image'],
      instructor: json['instructor'],
      user: json['user'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
