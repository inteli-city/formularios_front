// Mocks generated by Mockito 5.4.4 from annotations
// in formularios_front/test/app/presentation/home/stores/forms_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:formularios_front/app/domain/entities/form_entity.dart' as _i7;
import 'package:formularios_front/app/domain/entities/justificative_entity.dart'
    as _i19;
import 'package:formularios_front/app/domain/entities/section_entity.dart'
    as _i13;
import 'package:formularios_front/app/domain/entities/template_entity.dart'
    as _i16;
import 'package:formularios_front/app/domain/enum/form_status_enum.dart'
    as _i10;
import 'package:formularios_front/app/domain/enum/priority_enum.dart' as _i17;
import 'package:formularios_front/app/domain/repositories/form_repository.dart'
    as _i2;
import 'package:formularios_front/app/domain/usecases/cancel_form_usecase.dart'
    as _i18;
import 'package:formularios_front/app/domain/usecases/create_form_usecase.dart'
    as _i15;
import 'package:formularios_front/app/domain/usecases/fetch_forms_locally_usecase.dart'
    as _i8;
import 'package:formularios_front/app/domain/usecases/fetch_user_forms_usecase.dart'
    as _i4;
import 'package:formularios_front/app/domain/usecases/save_form_usecase.dart'
    as _i14;
import 'package:formularios_front/app/domain/usecases/send_form_usecase.dart'
    as _i12;
import 'package:formularios_front/app/domain/usecases/update_form_usecase.dart'
    as _i9;
import 'package:formularios_front/app/presentation/home/controllers/filter_form_controller.dart'
    as _i11;
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeIFormRepository_0 extends _i1.SmartFake
    implements _i2.IFormRepository {
  _FakeIFormRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FetchUserFormsUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchUserFormsUsecase extends _i1.Mock
    implements _i4.FetchUserFormsUsecase {
  MockFetchUserFormsUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IFormRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeIFormRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.IFormRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.FormEntity>>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.FormEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.FormEntity>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.FormEntity>>>);
}

/// A class which mocks [FetchFormsLocallyUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchFormsLocallyUsecase extends _i1.Mock
    implements _i8.FetchFormsLocallyUsecase {
  MockFetchFormsLocallyUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IFormRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeIFormRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.IFormRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.FormEntity>>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.FormEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.FormEntity>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.FormEntity>>>);
}

/// A class which mocks [IUpdateFormStatusUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockIUpdateFormStatusUseCase extends _i1.Mock
    implements _i9.IUpdateFormStatusUseCase {
  MockIUpdateFormStatusUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.FormEntity>> call({
    required _i10.FormStatusEnum? status,
    required String? formId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {
            #status: status,
            #formId: formId,
          },
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.FormEntity>>.value(
            _FakeEither_1<_i6.Failure, _i7.FormEntity>(
          this,
          Invocation.method(
            #call,
            [],
            {
              #status: status,
              #formId: formId,
            },
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.FormEntity>>);
}

/// A class which mocks [FilterFormsController].
///
/// See the documentation for Mockito's code generation for more information.
class MockFilterFormsController extends _i1.Mock
    implements _i11.FilterFormsController {
  MockFilterFormsController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set filteredTemplate(String? _filteredTemplate) => super.noSuchMethod(
        Invocation.setter(
          #filteredTemplate,
          _filteredTemplate,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set filteredStreet(String? _filteredStreet) => super.noSuchMethod(
        Invocation.setter(
          #filteredStreet,
          _filteredStreet,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set filteredCity(String? _filteredCity) => super.noSuchMethod(
        Invocation.setter(
          #filteredCity,
          _filteredCity,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set filteredSystem(String? _filteredSystem) => super.noSuchMethod(
        Invocation.setter(
          #filteredSystem,
          _filteredSystem,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set filteredStatus(_i10.FormStatusEnum? _filteredStatus) =>
      super.noSuchMethod(
        Invocation.setter(
          #filteredStatus,
          _filteredStatus,
        ),
        returnValueForMissingStub: null,
      );

  @override
  int get activeFiltersAmount => (super.noSuchMethod(
        Invocation.getter(#activeFiltersAmount),
        returnValue: 0,
      ) as int);

  @override
  void setTemplate(String? value) => super.noSuchMethod(
        Invocation.method(
          #setTemplate,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setStreet(String? value) => super.noSuchMethod(
        Invocation.method(
          #setStreet,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setCity(String? value) => super.noSuchMethod(
        Invocation.method(
          #setCity,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setSystem(String? value) => super.noSuchMethod(
        Invocation.method(
          #setSystem,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setStatus(_i10.FormStatusEnum? value) => super.noSuchMethod(
        Invocation.method(
          #setStatus,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void clearFilters() => super.noSuchMethod(
        Invocation.method(
          #clearFilters,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ISendFormUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockISendFormUsecase extends _i1.Mock implements _i12.ISendFormUsecase {
  MockISendFormUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.FormEntity>> call({
    required String? formId,
    required List<_i13.SectionEntity>? sections,
    String? vinculationFormId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {
            #formId: formId,
            #sections: sections,
            #vinculationFormId: vinculationFormId,
          },
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.FormEntity>>.value(
            _FakeEither_1<_i6.Failure, _i7.FormEntity>(
          this,
          Invocation.method(
            #call,
            [],
            {
              #formId: formId,
              #sections: sections,
              #vinculationFormId: vinculationFormId,
            },
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.FormEntity>>);
}

/// A class which mocks [ISaveFormUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockISaveFormUsecase extends _i1.Mock implements _i14.ISaveFormUsecase {
  MockISaveFormUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.FormEntity>> call(
          {required _i7.FormEntity? form}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#form: form},
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.FormEntity>>.value(
            _FakeEither_1<_i6.Failure, _i7.FormEntity>(
          this,
          Invocation.method(
            #call,
            [],
            {#form: form},
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.FormEntity>>);
}

/// A class which mocks [ICreateFormUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockICreateFormUsecase extends _i1.Mock
    implements _i15.ICreateFormUsecase {
  MockICreateFormUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.FormEntity>> call({
    required _i16.TemplateEntity? template,
    required String? area,
    required String? city,
    required String? street,
    required int? number,
    required double? latitude,
    required double? longitude,
    required String? region,
    required _i17.PriorityEnum? priority,
    required String? description,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {
            #template: template,
            #area: area,
            #city: city,
            #street: street,
            #number: number,
            #latitude: latitude,
            #longitude: longitude,
            #region: region,
            #priority: priority,
            #description: description,
          },
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.FormEntity>>.value(
            _FakeEither_1<_i6.Failure, _i7.FormEntity>(
          this,
          Invocation.method(
            #call,
            [],
            {
              #template: template,
              #area: area,
              #city: city,
              #street: street,
              #number: number,
              #latitude: latitude,
              #longitude: longitude,
              #region: region,
              #priority: priority,
              #description: description,
            },
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.FormEntity>>);
}

/// A class which mocks [ICancelFormUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockICancelFormUseCase extends _i1.Mock
    implements _i18.ICancelFormUseCase {
  MockICancelFormUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.FormEntity>> call({
    required _i19.JustificativeEntity? justificative,
    required String? formId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {
            #justificative: justificative,
            #formId: formId,
          },
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.FormEntity>>.value(
            _FakeEither_1<_i6.Failure, _i7.FormEntity>(
          this,
          Invocation.method(
            #call,
            [],
            {
              #justificative: justificative,
              #formId: formId,
            },
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.FormEntity>>);
}
