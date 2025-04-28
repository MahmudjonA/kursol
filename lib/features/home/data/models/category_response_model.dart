import 'package:lms_system/features/home/domain/entities/category_responce.dart';
import '../../domain/entities/category.dart';

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
      next: json['next'],
      previous: json['previous'],
      results:
          (json['results'] as List<dynamic>)
              .map((item) => Category.fromJson(item))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((item) => item.toJson()).toList(),
    };
  }
}
