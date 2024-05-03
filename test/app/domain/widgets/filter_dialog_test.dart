import 'package:auto_injector/auto_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/injector.dart';
import 'package:formularios_front/app/presentation/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/presentation/widgets/dialogs/filter_order_dialog.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'filter_dialog_test.mocks.dart';

@GenerateMocks([FormUserProvider, FilterFormsController])
void main() {
  injector.addLazySingleton<FormUserProvider>(MockFormUserProvider.new);
  injector
      .addLazySingleton<FilterFormsController>(MockFilterFormsController.new);
  injector.commit();

  late FilterFormsController mockController;
  late FormUserProvider mockProvider;
  
  group('FilterOrderDialog Widget Tests', () {
    setUp(() {
       mockController = injector.get<FilterFormsController>(
          transform: changeParam(MockFilterFormsController()));

    mockProvider = injector.get<FormUserProvider>(
          transform: changeParam(MockFormUserProvider()));

      when(mockController.filteredTemplate).thenReturn('Template1');
      when(mockController.filteredStreet).thenReturn('Street1');
      when(mockController.filteredCity).thenReturn('City1');
      when(mockController.filteredSystem).thenReturn('System1');
      when(mockController.clearFilters()).thenReturn(null);

      when(mockProvider.templates).thenReturn(['Template1', 'Template2']);
      when(mockProvider.streets).thenReturn(['Street1', 'Street2']);
      when(mockProvider.cities).thenReturn(['City1', 'City2']);
      when(mockProvider.systems).thenReturn(['System1', 'System2']);
    });

    testWidgets('FilterOrderDialog UI Test', (WidgetTester tester) async {
      await S.load(const Locale.fromSubtags(languageCode: 'en'));

      await tester.pumpWidget(
        MaterialApp(
          home: MultiProvider(providers: [
            Provider<FilterFormsController>(create: (_) => mockController),
            ChangeNotifierProvider<FormUserProvider>(
                create: (_) => mockProvider),
          ], child: const FilterOrderDialog()),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('Tipo'), findsOneWidget);
      expect(find.text('Rua'), findsOneWidget);
      expect(find.text('Cidade'), findsOneWidget);
      expect(find.text('Sistema de Origem'), findsOneWidget);
    });
  });
}
