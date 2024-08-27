import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/information_field_entity.dart';
import 'package:formularios_front/app/domain/entities/justification_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:formularios_front/app/presentation/form/pages/form_details_page.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'form_details_page_test.mocks.dart';

@GenerateMocks([FormsProvider, FormEntity, SingleFormProvider, HttpClient])
void main() {
  MockFormEntity form = MockFormEntity();
  FormsProvider formUserProvider = MockFormsProvider();
  SingleFormProvider singleFormProvider = MockSingleFormProvider();
  HttpClient httpClient = MockHttpClient();

  setUp(() {
    HttpOverrides.global = HttpOverrides.current;

    Modular.bindModule(AppModule());
    Modular.bindModule(HomeModule());

    Modular.replaceInstance<FormsProvider>(formUserProvider);
    Modular.replaceInstance<SingleFormProvider>(singleFormProvider);

    when(form.system).thenReturn('system');
    when(form.template).thenReturn('Nome Template');
    when(form.street).thenReturn('Rua Samuel Morse');
    when(form.number).thenReturn(1);
    when(form.priority).thenReturn(PriorityEnum.HIGH);
    when(form.description).thenReturn('description');
    when(form.longitude).thenReturn(-23.610366);
    when(form.latitude).thenReturn(-46.694891);

    when(form.expirationDate).thenReturn(1715090009);
    when(form.creationDate).thenReturn(1715090009);

    when(form.formId).thenReturn('formId');
    when(form.vinculationFormId).thenReturn('vinculationForm3');
    when(form.creatorUserId).thenReturn('creatorUser4');
    when(form.informationFields).thenReturn([
      TextInformationFieldEntity(value: 'value'),
      ImageInformationFieldEntity(filePath: 'filePath'),
      MapInformationFieldEntity(latitude: 0, longitude: 0),
    ]);

    when(form.justification).thenReturn(
      JustificationEntity(
        options: [
          JustificationOptionEntity(
              option: 'option', requiredImage: false, requiredText: false),
        ],
        selectedOption: 'selectedOption',
        justificationText: 'justificationText',
        justificationImage: null,
      ),
    );

    when(formUserProvider.getFormByExternId(form.formId)).thenReturn(form);
    when(singleFormProvider.form).thenReturn(form);

    when(singleFormProvider.creationDate)
        .thenReturn(form.creationDate.toString());
    when(singleFormProvider.expirationDate)
        .thenReturn(form.expirationDate.toString());

    when(singleFormProvider.isFormStateLoading).thenReturn(false);
  });

  group('Form Details Page', () {
    HttpOverrides.global = null;
    testWidgets('Form Details Page displays details correctly',
        (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'en'));
      initializeDateFormatting('pt_BR', null);

      when(form.status).thenReturn(FormStatusEnum.NOT_STARTED);

      HttpOverrides.runZoned(
        () async {
          await tester.pumpWidget(ModularApp(
              module: AppModule(),
              child: const MaterialApp(
                home: FormDetailsPage(),
              )));
          expect(
              find.text('${form.system} - ${form.template}'), findsOneWidget);
          expect(find.text('Rua Samuel Morse'), findsOneWidget);
          expect(find.text('1'), findsOneWidget);
          expect(find.text('description'), findsOneWidget);
          expect(
              find.text(FormStatusEnum.NOT_STARTED.enumString), findsOneWidget);
          expect(find.text(PriorityEnum.HIGH.enumString), findsOneWidget);

          expect(find.text('1715090009'), findsExactly(2));

          expect(find.text('formId'), findsOneWidget);
          expect(find.text('vinculationForm3'), findsOneWidget);
          expect(find.text('creatorUser4'), findsOneWidget);

          expect(find.text('-23.610366'), findsOneWidget);
          expect(find.text('-46.694891'), findsOneWidget);

          expect(find.byType(GoogleMap), findsOneWidget);
          expect(find.text('value'), findsOneWidget);
        },
        createHttpClient: (securityContext) => MockHttpClient(),
      );
    });

    testWidgets(
        'Form Details Page displays details correctly when status is NOT_STARTED',
        (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);

      when(form.status).thenReturn(FormStatusEnum.NOT_STARTED);

      HttpOverrides.runZoned(
        () async {
          await tester.pumpWidget(ModularApp(
              module: AppModule(),
              child: const MaterialApp(
                home: FormDetailsPage(),
              )));
          expect(find.text('Iniciar'), findsOneWidget);
          expect(find.text('Cancelar'), findsOneWidget);
        },
        createHttpClient: (securityContext) => httpClient,
      );
    });

    testWidgets(
        'Form Details Page displays details correctly when status is IN_PROGRESS',
        (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);

      when(form.status).thenReturn(FormStatusEnum.IN_PROGRESS);

      HttpOverrides.runZoned(
        () async {
          await tester.pumpWidget(ModularApp(
              module: AppModule(),
              child: const MaterialApp(
                home: FormDetailsPage(),
              )));
          expect(find.text('Preencher'), findsOneWidget);
          expect(find.text('Retroceder'), findsOneWidget);
          expect(find.text('Cancelar'), findsOneWidget);
        },
        createHttpClient: (securityContext) => httpClient,
      );
    });

    testWidgets(
        'Form Details Page displays details correctly when status is CONCLUDED',
        (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);

      when(form.status).thenReturn(FormStatusEnum.CONCLUDED);

      HttpOverrides.runZoned(
        () async {
          await tester.pumpWidget(ModularApp(
              module: AppModule(),
              child: const MaterialApp(
                home: FormDetailsPage(),
              )));
          expect(find.text(S.current.viewFilledForm), findsOne);
        },
        createHttpClient: (securityContext) => httpClient,
      );
    });

    testWidgets(
        'Form Details Page displays details correctly when status is CANCELED',
        (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);

      when(form.status).thenReturn(FormStatusEnum.CANCELED);

      HttpOverrides.runZoned(
        () async {
          await tester.pumpWidget(ModularApp(
              module: AppModule(),
              child: const MaterialApp(
                home: FormDetailsPage(),
              )));
          expect(find.byElementType(ElevatedButton), findsNothing);
        },
        createHttpClient: (securityContext) => httpClient,
      );
    });

    testWidgets('display justification info correctly',
        (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);

      when(form.status).thenReturn(FormStatusEnum.CANCELED);

      HttpOverrides.runZoned(
        () async {
          await tester.pumpWidget(ModularApp(
              module: AppModule(),
              child: const MaterialApp(
                home: FormDetailsPage(),
              )));
          expect(find.byElementType(ElevatedButton), findsNothing);
          expect(
              find.text(form.justification.justificationText!), findsOneWidget);
          expect(find.byType(Image), findsOneWidget);
        },
        createHttpClient: (securityContext) => httpClient,
      );
    });

    testWidgets('display information correctly', (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);

      when(form.status).thenReturn(FormStatusEnum.NOT_STARTED);
      when(form.informationFields).thenReturn([
        TextInformationFieldEntity(value: 'value'),
        ImageInformationFieldEntity(filePath: 'value'),
        MapInformationFieldEntity(latitude: 0, longitude: 0),
      ]);

      HttpOverrides.runZoned(
        () async {
          await tester.pumpWidget(ModularApp(
              module: AppModule(),
              child: const MaterialApp(
                home: FormDetailsPage(),
              )));
          expect(find.byElementType(ElevatedButton), findsNothing);

          expect(
              find.text(
                  (form.informationFields![0] as TextInformationFieldEntity)
                      .value),
              findsOneWidget);
          expect(find.byType(GoogleMap), findsOneWidget);
          expect(find.byType(Image), findsOneWidget);
        },
        createHttpClient: (securityContext) => httpClient,
      );
    });
  });
}
