import 'package:lms_system/features/auth/domain/entities/register_response_user.dart';

class RegisterUserModel extends RegisterResponseUser {
  RegisterUserModel({required super.userId});

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) {
    return RegisterUserModel(userId: json['user_id']);
  }

  Map<String, dynamic> toJson() {
    return {'user_id': userId};
  }
}
