import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/presentation/widgets/default_order_widget.dart';
import 'package:formularios_front/app/presentation/widgets/order_tab_section.dart';
import 'package:formularios_front/app/presentation/widgets/search_filter_tab.dart';

void main() {
  group('OrderTabSection Tests', () {
    testWidgets('OrderTabSection builds correctly with expected widgets',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: OrderTabSection(),
        ),
      ));

      expect(find.byType(DefaultOrderWidget), findsNWidgets(3));

      expect(find.byType(SearchFilterTab), findsOneWidget);

      final List<String> filterTitles = [
        'Não Iniciado',
        'Em andamento',
        'Concluído'
      ];
      
      expect(find.byKey(Key(filterTitles[0])), findsOneWidget);
      expect(find.byKey(Key(filterTitles[1])), findsOneWidget);
      expect(find.byKey(Key(filterTitles[2])), findsOneWidget);
    });
  });
}
