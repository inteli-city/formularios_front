import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/presentation/controllers/form_details_controller.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/presentation/pages/form_details_page.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'form_details_page_test.mocks.dart';

@GenerateMocks([FormUserProvider, FormEntity, FormDetailsController])
void main() {
  MockFormEntity form = MockFormEntity();
  late FormUserProvider formUserProvider = MockFormUserProvider();
  late FormDetailsController formDetailsController =
      MockFormDetailsController();

  setUp(() {
    Modular.bindModule(AppModule());
    Modular.bindModule(HomeModule());

    Modular.replaceInstance<FormUserProvider>(formUserProvider);
    Modular.replaceInstance<FormDetailsController>(formDetailsController);

    when(form.system).thenReturn('system');
    when(form.template).thenReturn('Nome Template');
    when(form.street).thenReturn('Rua Samuel Morse');
    when(form.number).thenReturn(1);
    when(form.priority).thenReturn(PriorityEnum.HIGH);
    when(form.description).thenReturn('description');
    when(form.longitude).thenReturn(10.0);
    when(form.latitude).thenReturn(11.0);

    when(form.expirationDate).thenReturn(1715090009);
    when(form.creationDate).thenReturn(1715090009);

    when(form.coordinatorsId).thenReturn(['coordinatorsId', 'coordinatorId1']);
    when(form.externFormId).thenReturn('externForm1');
    when(form.internFormId).thenReturn('internForm2');
    when(form.vinculationFormId).thenReturn('vinculationForm3');
    when(form.creatorUserId).thenReturn('creatorUser4');

    when(formUserProvider.getFormByExternId(form.externFormId))
        .thenReturn(form);
    when(formDetailsController.form).thenReturn(form);
    when(formDetailsController.externFormId).thenReturn(form.externFormId);

    when(formDetailsController.creationDate)
        .thenReturn(form.creationDate.toString());
    when(formDetailsController.expirationDate)
        .thenReturn(form.expirationDate.toString());
  });

  group('Form Details Page', () {
    testWidgets('Form Details Page displays details correctly',
        (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'en'));
      initializeDateFormatting('pt_BR', null);

      when(form.status).thenReturn(FormStatusEnum.NAO_INICIADO);

      await tester.pumpWidget(ModularApp(
          module: AppModule(),
          child: const MaterialApp(
            home: FormDetailsPage(),
          )));
      await tester.pumpAndSettle();

      expect(find.text('${form.system} - ${form.template}'), findsOneWidget);
      expect(find.text('Rua Samuel Morse'), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
      expect(find.text('description'), findsOneWidget);
      expect(find.text(FormStatusEnum.NAO_INICIADO.enumString), findsOneWidget);
      expect(find.text(PriorityEnum.HIGH.enumString), findsOneWidget);

      expect(find.text('1715090009'), findsExactly(2));

      expect(find.text('coordinatorsId-coordinatorId1'), findsOneWidget);
      expect(find.text('externForm1'), findsOneWidget);
      expect(find.text('internForm2'), findsOneWidget);
      expect(find.text('vinculationForm3'), findsOneWidget);
      expect(find.text('creatorUser4'), findsOneWidget);

      expect(find.text('10.0'), findsOneWidget);
      expect(find.text('11.0'), findsOneWidget);
    });

    testWidgets(
        'Form Details Page displays details correctly when status is NAO_INICIADO',
        (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'en'));
      initializeDateFormatting('pt_BR', null);

      when(form.status).thenReturn(FormStatusEnum.NAO_INICIADO);

      await tester.pumpWidget(ModularApp(
          module: AppModule(),
          child: const MaterialApp(
            home: FormDetailsPage(),
          )));
      await tester.pumpAndSettle();

      expect(find.text('Iniciar'), findsOneWidget);
      expect(find.text('Cancelar Formulário'), findsOneWidget);
      expect(find.text('Vincular Formulário'), findsOneWidget);
    });

    testWidgets(
        'Form Details Page displays details correctly when status is EM_ANDAMENTO',
        (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'en'));
      initializeDateFormatting('pt_BR', null);

      when(form.status).thenReturn(FormStatusEnum.EM_ANDAMENTO);

      await tester.pumpWidget(ModularApp(
          module: AppModule(),
          child: const MaterialApp(
            home: FormDetailsPage(),
          )));
      await tester.pumpAndSettle();

      expect(find.text('Preencher Formulário'), findsOneWidget);
      expect(find.text('Retroceder Formulário'), findsOneWidget);
      expect(find.text('Cancelar Formulário'), findsOneWidget);
      expect(find.text('Vincular Formulário'), findsOneWidget);
    });
  });
}
