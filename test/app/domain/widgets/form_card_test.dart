import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/presentation/widgets/form_card.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'form_card_test.mocks.dart';

@GenerateMocks([FormEntity, FormUserProvider])
void main() {
  group('FormCard Widget Tests', () {
    late MockFormEntity form;
    Modular.bindModule(AppModule());
    Modular.bindModule(HomeModule());

    setUp(() {
      form = MockFormEntity();
      when(form.template).thenReturn('Nome Template');
      when(form.street).thenReturn('Rua Samuel Morse');
      when(form.system).thenReturn('system');
      when(form.externFormId).thenReturn('externFormId1');
      when(form.city).thenReturn('city');
      when(form.number).thenReturn(0);
      when(form.description).thenReturn('description');
      when(form.status).thenReturn(FormStatusEnum.EM_ANDAMENTO);
      when(form.expirationDate).thenReturn(1);
    });

    testWidgets('FormCard builds correctly with given FormEntity',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: FormCard(form: form),
      ));

      expect(
          find.text('${form.system} - ${form.template} - ${form.externFormId}'),
          findsOneWidget);
      expect(find.text('${form.city} - ${form.street}, ${form.number}'),
          findsOneWidget);
      expect(find.text('description'), findsOneWidget);

      expect(
          find.text(DateFormat('dd/MM/yyyy HH:mm:ss').format(
              DateTime.fromMillisecondsSinceEpoch(form.expirationDate))),
          findsOneWidget);
    });
  });
}
