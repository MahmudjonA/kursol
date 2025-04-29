import 'package:lms_system/features/home/domain/entities/response_wishlist.dart';
import '../../domain/entities/wishlist.dart';

class ResponseWishlistModel extends WishlistResponse {
  ResponseWishlistModel({
    required super.count,
    required super.results,
    super.next,
    super.previous,
  });

  factory ResponseWishlistModel.fromJson(Map<String, dynamic> json) {
    return ResponseWishlistModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results:
          (json['results'] as List)
              .map((item) => Wishlist.fromJson(item))
              .toList(),
    );
  }
}
