import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/presentation/home/pages/home_page.dart';
import 'package:formularios_front/app/presentation/stores/states/form_user_state.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';

import 'home_page_test.mocks.dart';

@GenerateMocks([FormProvider])
void main() {
  group('HomePage Widget Tests', () {
    FormProvider formUserProvider = MockFormProvider();

    Modular.bindModule(AppModule());
    Modular.bindModule(HomeModule());
    Modular.replaceInstance<FormProvider>(formUserProvider);
    testWidgets('should display CircularProgressIndicator when loading',
        (WidgetTester tester) async {
      when(formUserProvider.state).thenReturn(FormUserLoadingState());

      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider<FormProvider>(
          create: (_) => formUserProvider,
          child: const HomePage(),
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display error message when in error state',
        (WidgetTester tester) async {
      var failure = Failure(message: 'Error Message');
      when(formUserProvider.state)
          .thenReturn(FormUserErrorState(error: failure));
      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider<FormProvider>(
          create: (_) => formUserProvider,
          child: const HomePage(),
        ),
      ));

      expect(find.byKey(const Key('error-build')), findsOneWidget);
    });
  });
}
