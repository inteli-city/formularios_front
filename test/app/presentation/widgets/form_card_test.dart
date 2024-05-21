import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/presentation/widgets/form_card.dart';
import 'package:intl/intl.dart';

void main() {
  group('FormCard Widget Tests', () {
    FormEntity form = FormEntity(
        formId: 'ID1142342524242',
        creatorUserId: '1',
        userId: '1',
        coordinatorsId: ['1314312731967', '1314312731967', '1314312731967'],
        vinculationFormId: '10',
        template: 'Poda de Árvore',
        area: 'area',
        system: 'Gaia',
        street: 'Rua Samuel Morse',
        city: 'São Paulo',
        number: 120,
        latitude: -23.61148,
        longitude: -46.69416,
        region: 'region',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing  elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.',
        priority: PriorityEnum.HIGH,
        status: FormStatusEnum.CONCLUDED,
        expirationDate: 1715000631000,
        creationDate: 1704561963000,
        startDate: 1,
        endDate: 1,
        justificative: JustificativeEntity(
            options: [], selectedOption: null, text: 'text', image: null),
        comments: 'comments',
        sections: [],
        canVinculate: false,
        formTitle: 'formTitle');

    testWidgets('FormCard builds correctly with given FormEntity',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: FormCard(form: form),
        ),
      );
      TestWidgetsFlutterBinding.ensureInitialized();

      // await Future.delayed(const Duration(seconds: 1));

      expect(find.text('${form.system} - ${form.template} - ${form.formId}'),
          findsOneWidget);
      expect(find.text('${form.city} - ${form.street}, ${form.number}'),
          findsOneWidget);
      expect(find.text(form.description!), findsOneWidget);

      expect(
        find.text(
          DateFormat('dd/MM/yyyy HH:mm:ss').format(
            DateTime.fromMillisecondsSinceEpoch(form.expirationDate),
          ),
        ),
        findsOneWidget,
      );
    });
  });
}
