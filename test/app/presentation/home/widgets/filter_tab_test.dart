import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/presentation/home/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/home/controllers/select_chip_controller.dart';
import 'package:formularios_front/app/presentation/home/controllers/sort_forms_controller.dart';
import 'package:formularios_front/app/presentation/home/states/form_user_state.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:formularios_front/app/presentation/home/widgets/filter_tab_widget.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'filter_tab_test.mocks.dart';

@GenerateMocks([
  FilterFormsController,
  SelectChipController,
  SortFormsController,
  FormsProvider,
])
void main() {
  testWidgets('FilterTabWidget builds correctly', (WidgetTester tester) async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    Modular.bindModule(HomeModule());
    final mockFormsProvider = MockFormsProvider();

    Modular.replaceInstance<FormsProvider>(mockFormsProvider);

    when(mockFormsProvider.state).thenReturn(FormUserLoadingState());
    when(mockFormsProvider.getFormsCountByStatus(FormStatusEnum.CONCLUDED))
        .thenReturn(FormStatusEnum.CONCLUDED.enumString);
    when(mockFormsProvider.getFormsCountByStatus(FormStatusEnum.NOT_STARTED))
        .thenReturn(FormStatusEnum.NOT_STARTED.enumString);
    when(mockFormsProvider.getFormsCountByStatus(FormStatusEnum.IN_PROGRESS))
        .thenReturn(FormStatusEnum.IN_PROGRESS.enumString);
    when(mockFormsProvider.getFormsCountByStatus(FormStatusEnum.CANCELED))
        .thenReturn(FormStatusEnum.CANCELED.enumString);

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: FilterTabWidget()),
      localizationsDelegates: [S.delegate],
    ));

    expect(find.byType(ChoiceChip), findsWidgets);
    expect(find.text(S.current.sort), findsOneWidget);
    expect(find.byIcon(Icons.filter_list), findsOneWidget);
  });
}
