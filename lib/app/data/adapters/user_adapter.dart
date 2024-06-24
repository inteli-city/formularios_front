import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/enum/role_enum.dart';

class UserAdapter {
  static List<UserEntity> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }

  static UserEntity fromJson(Map<String, dynamic> json) {
    return UserEntity(
      userId: json['profile_id'],
      name: json['name'],
      email: json['email'],
      enabled: json['enabled'],
      role: RoleEnum.values.firstWhere((e) => e.name == json['role']),
      groups: List<String>.from(json['systems']),
    );
  }

  static Map<String, dynamic> toJson(UserEntity user) {
    return {
      'userId': user.userId,
      'name': user.name,
      'email': user.email,
      'enabled': user.enabled,
      'role': user.role.name,
      'groups': user.groups,
    };
  }
}
