import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/enum/role_enum.dart';
import 'package:formularios_front/app/data/adapters/user_adapter.dart';

void main() {
  group('UserAdapter', () {
    test('deve converter JSON para UserEntity', () {
      final json = {
        'profile_id': '123',
        'name': 'name',
        'email': 'email',
        'enabled': true,
        'role': RoleEnum.COORDINATOR.name,
        'systems': ['GAIA', 'GAIA'],
      };

      final user = UserAdapter.fromJson(json);

      expect(user.userId, '123');
      expect(user.name, 'name');
      expect(user.email, 'email');
      expect(user.enabled, true);
      expect(user.role, RoleEnum.COORDINATOR);
      expect(user.groups, ['GAIA', 'GAIA']);
    });

    test('deve converter UserEntity para JSON', () {
      final user = UserEntity(
        userId: '123',
        name: 'name',
        email: 'email',
        enabled: true,
        role: RoleEnum.COORDINATOR,
        groups: ['Group 1', 'Group 2'],
      );

      final json = UserAdapter.toJson(user);

      expect(json['userId'], '123');
      expect(json['name'], 'name');
      expect(json['email'], 'email');
      expect(json['enabled'], true);
      expect(json['role'], RoleEnum.COORDINATOR.name);
      expect(json['groups'], ['Group 1', 'Group 2']);
    });

    test('deve converter lista de JSON para lista de UserEntity', () {
      final jsonList = [
        {
          'profile_id': '123',
          'name': 'name',
          'email': 'email',
          'enabled': true,
          'role': RoleEnum.COORDINATOR.name,
          'systems': ['Group 1', 'Group 2'],
        },
        {
          'profile_id': '124',
          'name': 'name',
          'email': 'email',
          'enabled': false,
          'role': RoleEnum.FILLER.name,
          'systems': ['Group 3'],
        },
      ];

      final users = UserAdapter.fromJsonList(jsonList);

      expect(users.length, 2);
      expect(users[0].userId, '123');
      expect(users[1].userId, '124');
      expect(users[0].role, RoleEnum.COORDINATOR);
      expect(users[1].role, RoleEnum.FILLER);
    });
  });
}
