import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:formularios_front/app/presentation/map/pages/map_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';

import 'map_page_test.mocks.dart';

@GenerateMocks([FormsProvider])
void main() {
  FormsProvider mockFormsProvider = MockFormsProvider();
  Modular.bindModule(HomeModule());

  Modular.replaceInstance<FormsProvider>(mockFormsProvider);

  when(mockFormsProvider.locations).thenReturn([]);

  testWidgets('MapPage displays Google Map with markers',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MapPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(GoogleMap), findsOneWidget);
  });
}
