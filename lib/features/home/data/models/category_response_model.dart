import 'package:lms_system/features/home/data/models/category_model.dart';
import 'package:lms_system/features/home/domain/entities/category_responce.dart';

class CategoryResponseModel extends CategoryResponse {
  CategoryResponseModel({
    required super.count,
    required super.next,
    required super.previous,
    required super.results,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(
      count: json['count'] ?? 0,
      next: json['next'] ?? '',
      previous: json['previous'] ?? '',
      results:
          (json['results'] as List<dynamic>)
              .map((item) => CategoryModel.fromJson(item))
              .toList(),
    );
  }
}
