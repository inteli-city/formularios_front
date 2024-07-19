import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/presentation/home/widgets/form_card.dart';
import 'package:intl/intl.dart';

void main() {
  group('FormCard Widget Tests', () {
    List<FormEntity> forms = [
      FormEntity(
          formId: 'ID1142342524240',
          creatorUserId: '1',
          userId: '1',
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
          expirationDate: 715000631000,
          creationDate: 1704561963000,
          startDate: 1,
          conclusionDate: 1,
          justificative: JustificativeEntity(
              options: [],
              selectedOption: null,
              justificationText: 'text',
              justificationImage: null),
          comments: 'comments',
          sections: [
            SectionEntity(sectionId: 'section-01', fields: [
              TextFieldEntity(
                  placeholder: 'placeholder', key: 'key', isRequired: true)
            ]),
          ],
          canVinculate: false,
          formTitle: 'formTitle'),
      FormEntity(
          formId: 'ID1142342524241',
          creatorUserId: '1',
          userId: '1',
          vinculationFormId: '10',
          template: 'Poda de Árvore 1',
          area: 'area',
          system: 'Gaia 1',
          street: 'Rua Samuel Morse 1',
          city: 'São Paulo 1',
          number: 121,
          latitude: -23.61148,
          longitude: -46.69416,
          region: 'region',
          description:
              '1 Lorem ipsum dolor sit amet, consectetur adipiscing  elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.',
          priority: PriorityEnum.EMERGENCY,
          status: FormStatusEnum.CONCLUDED,
          expirationDate: 1715000631001,
          creationDate: 1704561963000,
          startDate: 1,
          conclusionDate: 1,
          justificative: JustificativeEntity(
              options: [],
              selectedOption: null,
              justificationText: 'text',
              justificationImage: null),
          comments: 'comments',
          sections: [
            SectionEntity(sectionId: 'section-01', fields: [
              TextFieldEntity(
                  placeholder: 'placeholder', key: 'key', isRequired: true)
            ]),
          ],
          canVinculate: false,
          formTitle: 'formTitle'),
      FormEntity(
          formId: 'ID1142342524242',
          creatorUserId: '1',
          userId: '1',
          vinculationFormId: '10',
          template: 'Poda de Árvore 2',
          area: 'area',
          system: 'Gaia 2',
          street: 'Rua Samuel Morse 2',
          city: 'São Paulo 2',
          number: 122,
          latitude: -23.61148,
          longitude: -46.69416,
          region: 'region',
          description:
              '2 Lorem ipsum dolor sit amet, consectetur adipiscing  elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.',
          priority: PriorityEnum.MEDIUM,
          status: FormStatusEnum.CONCLUDED,
          expirationDate: 2715000631002,
          creationDate: 1704561963000,
          startDate: 1,
          conclusionDate: 1,
          justificative: JustificativeEntity(
              options: [],
              selectedOption: null,
              justificationText: 'text',
              justificationImage: null),
          comments: 'comments',
          sections: [
            SectionEntity(sectionId: 'section-01', fields: [
              TextFieldEntity(
                  placeholder: 'placeholder', key: 'key', isRequired: true)
            ]),
          ],
          canVinculate: false,
          formTitle: 'formTitle'),
      FormEntity(
          formId: 'ID1142342524243',
          creatorUserId: '1',
          userId: '1',
          vinculationFormId: '10',
          template: 'Poda de Árvore 3',
          area: 'area',
          system: 'Gaia 3',
          street: 'Rua Samuel Morse 3',
          city: 'São Paulo 3',
          number: 123,
          latitude: -23.61148,
          longitude: -46.69416,
          region: 'region',
          description:
              '3 Lorem ipsum dolor sit amet, consectetur adipiscing  elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.',
          priority: PriorityEnum.LOW,
          status: FormStatusEnum.CONCLUDED,
          expirationDate: 371500063100,
          creationDate: 1704561963000,
          startDate: 1,
          conclusionDate: 1,
          justificative: JustificativeEntity(
              options: [],
              selectedOption: null,
              justificationText: 'text',
              justificationImage: null),
          comments: 'comments',
          sections: [
            SectionEntity(sectionId: 'section-01', fields: [
              TextFieldEntity(
                  placeholder: 'placeholder', key: 'key', isRequired: true)
            ]),
          ],
          canVinculate: false,
          formTitle: 'formTitle'),
    ];

    testWidgets('FormCard builds correctly with given FormEntity',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await tester.pumpWidget(
        MaterialApp(
          home: Column(children: [
            FormCard(form: forms[0]),
            FormCard(form: forms[1]),
            FormCard(form: forms[2]),
            FormCard(form: forms[3]),
          ]),
        ),
      );
      TestWidgetsFlutterBinding.ensureInitialized();
      // await Future.delayed(const Duration(seconds: 1));
      for (var form in forms) {
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
      }
    });
  });
}
