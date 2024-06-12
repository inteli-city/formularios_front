import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/presentation/home/pages/home_page.dart';
import 'package:formularios_front/app/presentation/home/states/form_user_state.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';

import 'home_page_test.mocks.dart';


@GenerateMocks([FormsProvider])
void main() {
  group('HomePage Widget Tests', () {
    FormsProvider formsProvider = MockFormsProvider();

    Modular.bindModule(AppModule());
    Modular.bindModule(HomeModule());
    Modular.replaceInstance<FormsProvider>(formsProvider);
    testWidgets('should display CircularProgressIndicator when loading',
        (WidgetTester tester) async {
      when(formsProvider.state).thenReturn(FormUserLoadingState());

      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider<FormsProvider>(
          create: (_) => formsProvider,
          child: const HomePage(),
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display error message when in error state',
        (WidgetTester tester) async {
      var failure = Failure(message: 'Error Message');
      when(formsProvider.state)
          .thenReturn(FormUserErrorState(error: failure));
      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider<FormsProvider>(
          create: (_) => formsProvider,
          child: const HomePage(),
        ),
      ));

      expect(find.byKey(const Key('error-build')), findsOneWidget);
    });
  });
}
