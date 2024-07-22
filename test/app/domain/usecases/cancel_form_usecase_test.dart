import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/usecases/cancel_form_usecase.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cancel_form_usecase_test.mocks.dart';

@GenerateMocks([IFormRepository])
void main() {
  Modular.bindModule(AppModule());
  IFormRepository formRepository = MockIFormRepository();
  late ICancelFormUseCase usecase;
  usecase = CancelFormUseCase(repository: formRepository);

  group('CancICancelFormUseCase', () {
    var justificative = JustificativeEntity(
      options: [
        JustificativeOptionEntity(
            option: 'option', requiredImage: true, requiredText: true),
      ],
      selectedOption: 'option',
      justificationText: 'text',
      justificationImage: 'image',
    );
    test('should return a list of FormEntity', () async {
      when(formRepository.cancelForm(
              justificative: justificative, formId: 'formId'))
          .thenAnswer((_) async => Right(JustificativeEntity(
                options: [
                  JustificativeOptionEntity(
                      option: 'option',
                      requiredImage: true,
                      requiredText: true),
                ],
                selectedOption: 'option',
                justificationText: 'text',
                justificationImage: 'image',
              )));

      var result = await usecase(formId: 'formId', justificative: justificative);

      expect(result.isRight(), true);
      expect(
        result.fold((l) => null, (forms) => forms),
        isA<JustificativeEntity>(),
      );
      expect(
        result.fold((l) => null, (r) => r.selectedOption),
        'option',
      );
    });

    test('should return a Failure', () async {
      S.load(const Locale.fromSubtags(languageCode: 'en'));
      when(formRepository.cancelForm(justificative: justificative, formId: 'formId'))
          .thenAnswer((_) async => Left(UnknownError()));

      var result = await usecase(formId: 'formId', justificative: justificative);

      expect(result.isLeft(), true);
      expect(
        result.fold((l) => l, (r) => null),
        isA<Failure>(),
      );
    });
  });
}
