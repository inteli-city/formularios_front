import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justification_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:formularios_front/app/presentation/map/pages/map_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'map_page_test.mocks.dart';

@GenerateMocks([FormsProvider])
void main() {
  var justification = JustificationEntity(
    options: [
      JustificationOptionEntity(
        option: 'option',
        requiredImage: true,
        requiredText: true,
      ),
    ],
    selectedOption: null,
    justificationText: null,
    justificationImage: null,
  );

  FormsProvider mockFormsProvider = MockFormsProvider();
  Modular.bindModule(HomeModule());

  Modular.replaceInstance<FormsProvider>(mockFormsProvider);

  var locations = [
    FormEntity(
      formTitle: 'Form Title',
      formId: 'ID1142342524242',
      creatorUserId: '1',
      userId: '1',
      vinculationFormId: '10',
      template: 'Poda de Árvore',
      area: 'area',
      system: 'Gaia',
      street: 'Rua Samuel Morse',
      city: 'São Paulo',
      number: 120,
      latitude: -23.610366,
      longitude: -46.694891,
      region: 'region',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing  elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.',
      priority: PriorityEnum.HIGH,
      status: FormStatusEnum.IN_PROGRESS,
      expirationDate: 1715000631000,
      creationDate: 1704561963000,
      startDate: 1,
      conclusionDate: 1,
      justification: justification,
      comments: 'comments',
      sections: [
        SectionEntity(
          sectionId: 'section-01',
          fields: [
            TypeAheadFieldEntity(
              options: ['option1', 'option2'],
              placeholder: 'TypeAhead',
              maxLength: 10,
              key: 'key-section-01-6',
              isRequired: true,
            ),
          ],
        ),
        SectionEntity(
          sectionId: 'section-02',
          fields: [
            SwitchButtonFieldEntity(
              placeholder: 'SwitchButton',
              key: 'key-section-02-0',
              isRequired: true,
            ),
          ],
        ),
      ],
      canVinculate: true,
    )
  ].map((form) => (form, LatLng(form.latitude, form.longitude))).toList();

  when(mockFormsProvider.locations).thenReturn(locations);

  testWidgets('MapPage displays Google Map with markers',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<FormsProvider>(
          create: (_) => mockFormsProvider,
          child: const MapPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(GoogleMap), findsOneWidget);

    final GoogleMap googleMap = tester.widget(find.byType(GoogleMap));
    expect(googleMap.markers.length, equals(locations.length));
  });
}
