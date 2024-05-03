import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/presentation/widgets/form_card.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'form_card_test.mocks.dart';

@GenerateMocks([FormEntity, FormUserProvider])
void main() {
  group('FormCard Widget Tests', () {
    late MockFormEntity form;
    Modular.bindModule(HomeModule());

    setUp(() {
      form = MockFormEntity();
      when(form.template).thenReturn('Nome Template');
      when(form.street).thenReturn('Rua Samuel Morse');
      when(form.status).thenReturn(FormStatusEnum.EM_ANDAMENTO);
      when(form.expirationDate).thenReturn(1);
    });

    testWidgets('FormCard builds correctly with given FormEntity',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: FormCard(form: form),
      ));

      expect(find.text('Nome Template'), findsOneWidget);
      expect(find.text('Rua Samuel Morse'), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
    });
  });
}
