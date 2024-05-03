import 'package:formularios_front/app/domain/enum/role_enum.dart';

class UserEntity {
  final String userId;
  final String name;
  final String email;
  final bool enabled;
  final RoleEnum role;
  final List<String> groups;

  UserEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.enabled,
    required this.role,
    required this.groups,
  });
}
