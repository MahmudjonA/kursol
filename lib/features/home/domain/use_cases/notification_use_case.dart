import 'package:lms_system/features/home/domain/entities/notification_response.dart';
import 'package:lms_system/features/home/domain/repositories/home_repo.dart';

class NotificationUseCase {
  final HomeRepo homeRepo;

  NotificationUseCase(this.homeRepo);

  Future<NotificationResponse> call() async {
    return await homeRepo.getNotifications();
  }
}
