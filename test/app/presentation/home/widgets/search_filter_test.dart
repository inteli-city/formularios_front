import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/presentation/home/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/home/controllers/select_chip_controller.dart';
import 'package:formularios_front/app/presentation/home/controllers/sort_forms_controller.dart';
import 'package:formularios_front/app/presentation/stores/states/form_user_state.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/presentation/home/widgets/filter_tab_widget.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_filter_test.mocks.dart';

@GenerateMocks([
  FilterFormsController,
  SelectChipController,
  SortFormsController,
  FormProvider,
])
void main() {
  testWidgets('FilterTabWidget builds correctly', (WidgetTester tester) async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    Modular.bindModule(HomeModule());
    final mockFormProvider = MockFormProvider();
    Modular.replaceInstance<FormProvider>(mockFormProvider);

    when(mockFormProvider.state).thenReturn(FormUserLoadingState());
    when(mockFormProvider.getFormsCountByStatus(FormStatusEnum.CONCLUDED))
        .thenReturn(FormStatusEnum.CONCLUDED.enumString);
    when(mockFormProvider.getFormsCountByStatus(FormStatusEnum.NOT_STARTED))
        .thenReturn(FormStatusEnum.NOT_STARTED.enumString);
    when(mockFormProvider.getFormsCountByStatus(FormStatusEnum.IN_PROGRESS))
        .thenReturn(FormStatusEnum.IN_PROGRESS.enumString);
    when(mockFormProvider.getFormsCountByStatus(FormStatusEnum.CANCELED))
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
