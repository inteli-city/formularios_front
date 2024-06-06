import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/presentation/home/controllers/sort_forms_controller.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/shared/widgets/dialogs/sort_forms_dialog.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/domain/enum/order_enum.dart';
import 'package:provider/provider.dart';

import 'sort_forms_dialog_test.mocks.dart';

@GenerateMocks([SortFormsController, FormUserProvider])
void main() {
  group('SortFormsDialog UI Test', () {
    late SortFormsController mockController;
    late FormUserProvider formUserProvider;

    setUp(() {
      Modular.bindModule(AppModule());
      Modular.bindModule(HomeModule());
      mockController = MockSortFormsController();
      formUserProvider = MockFormUserProvider();

      Modular.replaceInstance<SortFormsController>(mockController);
      Modular.replaceInstance<FormUserProvider>(formUserProvider);
    });

    testWidgets('Displays all order options', (WidgetTester tester) async {
      await S.load(const Locale.fromSubtags(languageCode: 'en'));

      when(mockController.selectedOrder).thenReturn(OrderEnum.MAIS_ANTIGO);
      when(mockController.setSelectedOrder(OrderEnum.MAIS_ANTIGO))
          .thenReturn(null);
      when(formUserProvider.orderForms(OrderEnum.MAIS_ANTIGO)).thenReturn(null);

      await tester.pumpWidget(
        MaterialApp(
          home: MultiProvider(
              providers: [
                Provider<SortFormsController>(create: (_) => mockController),
                ChangeNotifierProvider<FormUserProvider>(
                    create: (_) => formUserProvider),
              ],
              child: const Scaffold(
                  body: SizedBox(
                height: double.infinity,
                child: SortFormsDialog(),
              ))),
        ),
      );

      await tester.pumpAndSettle();

      for (final order in OrderEnum.values) {
        expect(find.text(order.enumString), findsOneWidget);
      }
    });
  });
}
