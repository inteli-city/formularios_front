import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/data/models/user_model.dart';
import 'package:formularios_front/app/domain/enum/role_enum.dart';

void main() {
  group('UserModel Tests', () {
    final userMap = {
      'profile_id': '1',
      'name': 'John Doe',
      'email': 'john.doe@example.com',
      'enabled': true,
      'role': RoleEnum.COORDINATOR.name,
      'systems': ['System1', 'System2'],
    };

    test('should create UserModel from map', () {
      final userModel = UserModel.fromMap(userMap);

      expect(userModel.userId, '1');
      expect(userModel.name, 'John Doe');
      expect(userModel.email, 'john.doe@example.com');
      expect(userModel.enabled, true);
      expect(userModel.role, RoleEnum.COORDINATOR);
      expect(userModel.groups, ['System1', 'System2']);
    });
  });
}
