import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/enum/role_enum.dart';

void main() {
  group('UserEntity', () {
    test('deve criar um UserEntity a partir de um JSON', () {
      final userEntity = UserEntity(
          email: 'joao@example.com',
          enabled: true,
          groups: ['group1', 'group2'],
          name: 'joao',
          role: RoleEnum.COORDINATOR,
          userId: '123');

      expect(userEntity.userId, '123');
      expect(userEntity.name, 'joao');
      expect(userEntity.email, 'joao@example.com');
      expect(userEntity.enabled, true);
      expect(userEntity.role, RoleEnum.COORDINATOR);
      expect(userEntity.groups, ['group1', 'group2']);
    });
  });
}
