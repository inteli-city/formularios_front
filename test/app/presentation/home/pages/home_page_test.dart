import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/presentation/home/pages/home_page.dart';
import 'package:formularios_front/app/presentation/home/states/form_user_state.dart';
import 'package:formularios_front/generated/l10n.dart';
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
      var failure = Failure(errorMessage: 'Error Message');
      when(formsProvider.state).thenReturn(FormUserErrorState(error: failure));
      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider<FormsProvider>(
          create: (_) => formsProvider,
          child: const HomePage(),
        ),
      ));

      expect(find.byKey(const Key('error-build')), findsOneWidget);
    });

    group('successful build', () {
      setUp(() {
        when(formsProvider.state)
            .thenReturn(const FormUserSuccessState(forms: []));
        when(formsProvider.getFormsCountByStatus(FormStatusEnum.CANCELED))
            .thenReturn('CANCELED');
        when(formsProvider.getFormsCountByStatus(FormStatusEnum.NOT_STARTED))
            .thenReturn('NOT_STARTED');
        when(formsProvider.getFormsCountByStatus(FormStatusEnum.IN_PROGRESS))
            .thenReturn('IN_PROGRESS');
        when(formsProvider.getFormsCountByStatus(FormStatusEnum.CONCLUDED))
            .thenReturn('CONCLUDED');
      });

      testWidgets('should build successfully without forms',
          (WidgetTester tester) async {
        await S.load(const Locale.fromSubtags(languageCode: 'en'));
        when(formsProvider.state)
            .thenReturn(const FormUserSuccessState(forms: []));
        await tester.pumpWidget(MaterialApp(
          localizationsDelegates: const [
            S.delegate,
          ],
          home: ChangeNotifierProvider<FormsProvider>(
            create: (_) => formsProvider,
            child: const Scaffold(
              body: HomePage(),
            ),
          ),
        ));

        await tester.pumpAndSettle();

        expect(find.byKey(const Key('success-build-empty')), findsOne);
      });

      testWidgets('should build successfully without forms',
          (WidgetTester tester) async {
        await S.load(const Locale.fromSubtags(languageCode: 'en'));
        when(formsProvider.state).thenReturn(FormUserSuccessState(forms: [
          FormEntity(
            formId: '1',
            creatorUserId: 'creatorUserId',
            userId: 'userId',
            vinculationFormId: 'vinculationFormId',
            template: 'template',
            area: 'area',
            system: 'system',
            street: 'street',
            city: 'city',
            number: 1,
            latitude: 1.0,
            longitude: 1.0,
            region: 'region',
            description: 'description',
            priority: PriorityEnum.HIGH,
            status: FormStatusEnum.IN_PROGRESS,
            expirationDate: 1,
            creationDate: 1,
            startDate: 1,
            conclusionDate: 1,
            justificative: JustificativeEntity(
              justificationImage: null,
              options: [],
              selectedOption: '',
              justificationText: '',
            ),
            comments: 'comments',
            sections: [
              SectionEntity(sectionId: 'section-01', fields: [
                TextFieldEntity(
                  fieldType: FieldTypeEnum.TEXT_FIELD,
                  placeholder: 'TextField 01',
                  isRequired: true,
                  key: 'key-section-01-1',
                ),
                TextFieldEntity(
                  fieldType: FieldTypeEnum.TEXT_FIELD,
                  placeholder: 'TextField 02',
                  isRequired: true,
                  key: 'key-section-01-2',
                ),
              ])
            ],
            formTitle: 'formTitle',
            canVinculate: false,
          ),
        ]));
        
        await tester.pumpWidget(MaterialApp(
          localizationsDelegates: const [
            S.delegate,
          ],
          home: ChangeNotifierProvider<FormsProvider>(
            create: (_) => formsProvider,
            child: const Scaffold(
              body: HomePage(),
            ),
          ),
        ));

        await tester.pumpAndSettle();

        expect(find.byKey(const Key('success-build-not-empty')), findsOne);
      });

      testWidgets('should build successfully', (WidgetTester tester) async {
        await S.load(const Locale.fromSubtags(languageCode: 'en'));

        await tester.pumpWidget(MaterialApp(
          localizationsDelegates: const [
            S.delegate,
          ],
          home: ChangeNotifierProvider<FormsProvider>(
            create: (_) => formsProvider,
            child: const Scaffold(
              body: HomePage(),
            ),
          ),
        ));

        await tester.pumpAndSettle();

        expect(find.byKey(const Key('success-build')), findsOneWidget);
      });
    });
  });
}
