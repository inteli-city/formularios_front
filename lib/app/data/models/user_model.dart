import 'package:formularios_front/app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.userId,
      required super.name,
      required super.email,
      required super.enabled,
      required super.role,
      required super.groups});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      name: map['name'],
      email: map['email'],
      enabled: map['enabled'],
      role: map['role'],
      groups: map['groups'],
    );
  }
}
