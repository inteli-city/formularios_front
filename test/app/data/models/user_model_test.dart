import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/data/models/user_model.dart';
import 'package:formularios_front/app/domain/enum/role_enum.dart'; 

void main() {
  group('UserModel', () {
    test('deve criar um UserModel a partir de um JSON', () {
      final Map<String, dynamic> userJson = {
        'userId': '123',
        'name': 'joao',
        'email': 'joao@example.com',
        'enabled': true,
        'role': RoleEnum.COORDINATOR,
        'groups': ['group1', 'group2'],
      };

      final userModel = UserModel.fromJson(userJson);

      expect(userModel.userId, '123');
      expect(userModel.name, 'joao');
      expect(userModel.email, 'joao@example.com');
      expect(userModel.enabled, true);
      expect(userModel.role, RoleEnum.COORDINATOR);
      expect(userModel.groups, ['group1', 'group2']);
    });

    test('deve lançar um erro se o JSON estiver incompleto', () {
      final Map<String, dynamic> incompleteJson = {
        'userId': '123',
        // 'name': 'joao', 
        'email': 'joao@example.com',
        'enabled': true,
        'role': RoleEnum.COORDINATOR,
        'groups': ['group1', 'group2'],
      };

      expect(() => UserModel.fromJson(incompleteJson), throwsA(isA<TypeError>()));
    });
  });
}
