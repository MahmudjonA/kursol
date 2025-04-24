import 'package:lms_system/features/auth/domain/entities/auth_token.dart';

class AuthTokenModel extends AuthToken {
  AuthTokenModel({required super.refresh, required super.access});

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    return AuthTokenModel(
      refresh: json['refresh'] as String,
      access: json['access'] as String,
    );
  }
}
