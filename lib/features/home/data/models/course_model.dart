import 'package:lms_system/features/home/domain/entities/courses.dart';
import '../../domain/entities/sections.dart';

class CourseModel extends Course {
  CourseModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.isPublished,
    required super.createdAt,
    required super.instructor,
    required super.sections,
    required super.category,
    required super.image,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      image: json['image'],
      isPublished: json['is_published'],
      createdAt: json['created_at'],
      instructor: json['instructor'],
      sections:
          (json['sections'] as List).map((e) => Section.fromJson(e)).toList(),
    );
  }
}
