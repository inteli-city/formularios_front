import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/presentation/home/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:formularios_front/app/shared/widgets/dialogs/filter_order_dialog.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';

import 'filter_dialog_test.mocks.dart';

@GenerateMocks([FormsProvider, FilterFormsController])
void main() {
  late FilterFormsController mockController;
  late FormsProvider mockProvider;
  Modular.bindModule(HomeModule());
  mockController = FilterFormsController();
  mockProvider = MockFormsProvider();

  group('FilterOrderDialog Widget Tests', () {
    testWidgets('FilterOrderDialog UI Test', (WidgetTester tester) async {
      await S.load(const Locale.fromSubtags(languageCode: 'en'));

      await tester.pumpWidget(
          MaterialApp(
            home: MultiProvider(providers: [
              Provider<FilterFormsController>(create: (_) => mockController),
              ChangeNotifierProvider<FormsProvider>(
                  create: (_) => mockProvider),
            ], child: const FilterOrderDialog()),
          ),
          duration: const Duration(seconds: 1));

      expect(find.text('Tipo'), findsOneWidget);
      expect(find.text('Rua'), findsOneWidget);
      expect(find.text('Cidade'), findsOneWidget);
      expect(find.text('Sistema de Origem'), findsOneWidget);
    });

    testWidgets('should set filter values when confirm button is pressed ',
        (WidgetTester tester) async {
      await S.load(const Locale.fromSubtags(languageCode: 'en'));

      await tester.pumpWidget(
          MaterialApp(
            home: MultiProvider(providers: [
              Provider<FilterFormsController>(create: (_) => mockController),
              ChangeNotifierProvider<FormsProvider>(
                  create: (_) => mockProvider),
            ], child: const FilterOrderDialog()),
          ),
          duration: const Duration(seconds: 1));

      await tester.tap(find.text(S.current.confirm));

      expect(mockController.filteredTemplate, null);
      expect(mockController.filteredStreet, null);
      expect(mockController.filteredCity, null);
      expect(mockController.filteredSystem, null);
    });

    testWidgets('should set filter values when confirm button is pressed ',
        (WidgetTester tester) async {
      await S.load(const Locale.fromSubtags(languageCode: 'en'));

      await tester.pumpWidget(
          MaterialApp(
            home: MultiProvider(providers: [
              Provider<FilterFormsController>(create: (_) => mockController),
              ChangeNotifierProvider<FormsProvider>(
                  create: (_) => mockProvider),
            ], child: const FilterOrderDialog()),
          ),
          duration: const Duration(seconds: 1));

      await tester.tap(find.text(S.current.confirm));

      expect(mockController.filteredTemplate, null);
      expect(mockController.filteredStreet, null);
      expect(mockController.filteredCity, null);
      expect(mockController.filteredSystem, null);
    });

    testWidgets('should clear selections when clear filters button is pressed ',
        (WidgetTester tester) async {
      await S.load(const Locale.fromSubtags(languageCode: 'en'));

      await tester.pumpWidget(
          MaterialApp(
            home: MultiProvider(providers: [
              Provider<FilterFormsController>(create: (_) => mockController),
              ChangeNotifierProvider<FormsProvider>(
                  create: (_) => mockProvider),
            ], child: const FilterOrderDialog()),
          ),
          duration: const Duration(seconds: 1));

      await tester.tap(find.text(S.current.clearFilters));

      expect(mockController.filteredTemplate, null);
      expect(mockController.filteredStreet, null);
      expect(mockController.filteredCity, null);
      expect(mockController.filteredSystem, null);
   
    });
  });
}
