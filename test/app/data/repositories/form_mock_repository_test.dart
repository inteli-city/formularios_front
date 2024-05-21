import 'dart:ui';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/data/repositories/form_mock_repository.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/generated/l10n.dart';

void main() {
  late FormMockRepository repository;

  setUp(() {
    repository = FormMockRepository();
  });

  test('should return all forms by userId', () async {
    var userId = repository.formList[0].userId;
    var result = await repository.getUserForms(userId: userId);

    expect(result.isRight(), true);

    var forms = result.fold((left) => null, (right) => right);
    expect(forms, isA<List<FormEntity>>());
    expect(forms!.length, greaterThan(0));
    expect(forms.every((form) => form.userId == userId), true);
  });

  test('should update a form status by formId', () async {
    var formId = repository.formList[0].formId;

    FormStatusEnum newStatus = FormStatusEnum.IN_PROGRESS;

    var result = await repository.updateFormStatus(
      status: newStatus,
      formId: formId,
    );

    expect(result.isRight(), true);

    var updatedForm = result.fold((left) => null, (right) => right);
    expect(updatedForm, isA<FormEntity>());
    expect(updatedForm!.status, newStatus);
  });

  test('should return failure when form not found', () async {
    Modular.bindModule(AppModule());
    await S.load(const Locale.fromSubtags(languageCode: 'pt'));
    var result = await repository.updateFormStatus(
      status: FormStatusEnum.IN_PROGRESS,
      formId: 'non_existent_form_id',
    );

    expect(result.isLeft(), true);

    var failure = result.fold((left) => left, (right) => null);
    expect(failure, isA<NoItemsFound>());
  });
}
