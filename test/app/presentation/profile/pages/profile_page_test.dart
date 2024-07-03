import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/enum/role_enum.dart';
import 'package:formularios_front/app/presentation/profile/pages/profile_page.dart';
import 'package:formularios_front/app/presentation/user/stores/user_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_page_test.mocks.dart';

@GenerateMocks([UserProvider])
void main() {
  late MockUserProvider mockUserProvider;

  setUp(() {
    mockUserProvider = MockUserProvider();
    when(mockUserProvider.user).thenReturn(UserEntity(
      enabled: false,
      role: RoleEnum.COORDINATOR,
      userId: '123',
      name: 'John Doe',
      email: 'john.doe@example.com',
      groups: ['Group 1', 'Group 2'],
    ));
    Modular.bindModule(AppModule());
    Modular.replaceInstance<UserProvider>(mockUserProvider);
  });

  testWidgets('ProfilePage displays user information and groups',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProfilePage(),
        ),
      ),
    );

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('john.doe@example.com'), findsOneWidget);
    expect(find.text('Group 1'), findsOneWidget);
    expect(find.text('Group 2'), findsOneWidget);
  });

  testWidgets('ProfilePage calls logout on button press',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProfilePage(),
        ),
      ),
    );

    final logoutButton = find.text('Sair');
    expect(logoutButton, findsOneWidget);

    await tester.tap(logoutButton);
    await tester.pump();

    verify(mockUserProvider.logout()).called(1);
  });
}
