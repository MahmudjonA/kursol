import 'package:lms_system/features/home/domain/repositories/home_repo.dart';

class AddToWishlistUseCase {
  final HomeRepo wishlistRepository;

  AddToWishlistUseCase(this.wishlistRepository);

  Future<void> call(int courseId) async {
    await wishlistRepository.addToWishlist(courseId: courseId);
  }
}
