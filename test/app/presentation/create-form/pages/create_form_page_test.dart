import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/justification_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/entities/template_entity.dart';
import 'package:formularios_front/app/presentation/create-form/pages/create_form_page.dart';
import 'package:formularios_front/app/presentation/create-form/states/template_state.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart' as gates_l10n;
import 'package:formularios_front/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:formularios_front/app/presentation/create-form/stores/template_provider.dart';
import 'package:mockito/mockito.dart';

import 'create_form_page_test.mocks.dart';

@GenerateMocks([TemplateProvider])
void main() {
  late MockTemplateProvider mockProvider = MockTemplateProvider();

  setUp(() {
    Modular.bindModule(AppModule());
    Modular.bindModule(HomeModule());
    Modular.replaceInstance<TemplateProvider>(mockProvider);
    when(mockProvider.isLoading).thenReturn(false);
  });

  tearDown(() {
    Modular.destroy();
  });

  group('CreateFormPage Tests', () {
    testWidgets('Renders CircularProgressIndicator on loading state',
        (WidgetTester tester) async {
      when(mockProvider.state).thenReturn(TemplateLoadingState());

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<TemplateProvider>(
            create: (_) => mockProvider,
            child: const CreateFormPage(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
    testWidgets('Displays error message when in error state',
        (WidgetTester tester) async {
      await gates_l10n.S.load(const Locale.fromSubtags(languageCode: 'pt-br'));
      when(mockProvider.state)
          .thenReturn(TemplateErrorState(error: UnknownError()));

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<TemplateProvider>(
            create: (_) => mockProvider,
            child: const CreateFormPage(),
          ),
        ),
      );

      expect(find.byKey(const Key('error-build')), findsOneWidget);
    });

    testWidgets('Renders form elements when in success state',
        (WidgetTester tester) async {
      await S.load(const Locale.fromSubtags(languageCode: 'pt-br'));
      when(mockProvider.state).thenReturn(
        TemplateSuccessState(
          templates: [
            TemplateEntity(
                template: 'template',
                sections: [
                  SectionEntity(sectionId: '123', fields: [
                    TextFieldEntity(
                        placeholder: 'placeholder',
                        key: 'key',
                        isRequired: false)
                  ])
                ],
                justification: JustificationEntity(
                    options: [
                      JustificationOptionEntity(
                          option: 'option',
                          requiredImage: true,
                          requiredText: true)
                    ],
                    selectedOption: 'selectedOption',
                    justificationText: 'justificationText',
                    justificationImage: 'justificationImage'),
                formTitle: 'formTitle',
                canVinculate: false,
                system: 'GAIA'),
          ],
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<TemplateProvider>(
            create: (_) => mockProvider,
            child: const Scaffold(
              body: CreateFormPage(),
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('success-build')), findsOneWidget);
    });
  });
}
