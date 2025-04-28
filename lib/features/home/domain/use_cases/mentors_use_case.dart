import 'package:lms_system/features/home/domain/repositories/home_repo.dart';

import '../entities/response_mentor.dart';

class MentorsUseCase {
  final HomeRepo mentorsRepository;

  MentorsUseCase(this.mentorsRepository);

  Future<ResponseMentor> call({required int limit}) async {
    return await mentorsRepository.getMentors(limit: limit);
  }
}