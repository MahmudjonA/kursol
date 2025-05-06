import 'package:lms_system/features/home/domain/entities/response_wishlist.dart';
import 'package:lms_system/features/home/domain/repositories/home_repo.dart';

class WishlistUseCase {
  HomeRepo homeRepo;

  WishlistUseCase(this.homeRepo);

  Future<WishlistResponse> call({
    required int limit,
    required int? categoryId,
  }) async {
    return await homeRepo.getWishlist(limit: limit, categoryId: categoryId);
  }
}
