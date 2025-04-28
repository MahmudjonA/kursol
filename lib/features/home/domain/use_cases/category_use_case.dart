import 'package:lms_system/features/home/domain/entities/category_responce.dart';
import 'package:lms_system/features/home/domain/repositories/home_repo.dart';

class CategoryUseCase {
  HomeRepo homeRepo;

  CategoryUseCase(this.homeRepo);

  Future<CategoryResponse> call({required int limit}) async {
    return await homeRepo.getCategories(limit: limit);
  }
}
