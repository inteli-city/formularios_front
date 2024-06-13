import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/enum/role_enum.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.userId,
      required super.name,
      required super.email,
      required super.enabled,
      required super.role,
      required super.groups});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['profile_id'],
      name: map['name'],
      email: map['email'],
      enabled: map['enabled'],
      role: RoleEnum.values.firstWhere((e) => e.name == map['role']),
      groups: List<String>.from(map['systems']),
    );
  }
}
