import 'package:lms_system/features/auth/domain/entities/register_response_user.dart';

class RegisterUserModel extends RegisterResponseUser {
  RegisterUserModel({required super.userId, required super.authType});

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) {
    return RegisterUserModel(
      userId: json['user_id'],
      authType: json['auth_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'user_id': userId, 'auth_type': authType};
  }
}
