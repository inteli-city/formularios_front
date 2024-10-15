// Mocks generated by Mockito 5.4.4 from annotations
// in formularios_front/test/app/presentation/form/widgets/fields/custom_number_field_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:ui' as _i8;

import 'package:formularios_front/app/domain/entities/form_entity.dart' as _i2;
import 'package:formularios_front/app/domain/entities/justification_entity.dart'
    as _i7;
import 'package:formularios_front/app/domain/enum/form_status_enum.dart' as _i5;
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i4;

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

class _FakeFormEntity_0 extends _i1.SmartFake implements _i2.FormEntity {
  _FakeFormEntity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SingleFormProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockSingleFormProvider extends _i1.Mock
    implements _i3.SingleFormProvider {
  MockSingleFormProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FormEntity get form => (super.noSuchMethod(
        Invocation.getter(#form),
        returnValue: _FakeFormEntity_0(
          this,
          Invocation.getter(#form),
        ),
      ) as _i2.FormEntity);

  @override
  bool get isFormStateLoading => (super.noSuchMethod(
        Invocation.getter(#isFormStateLoading),
        returnValue: false,
      ) as bool);

  @override
  set isFormStateLoading(bool? _isFormStateLoading) => super.noSuchMethod(
        Invocation.setter(
          #isFormStateLoading,
          _isFormStateLoading,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get creationDate => (super.noSuchMethod(
        Invocation.getter(#creationDate),
        returnValue: _i4.dummyValue<String>(
          this,
          Invocation.getter(#creationDate),
        ),
      ) as String);

  @override
  String get expirationDate => (super.noSuchMethod(
        Invocation.getter(#expirationDate),
        returnValue: _i4.dummyValue<String>(
          this,
          Invocation.getter(#expirationDate),
        ),
      ) as String);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void setIsFormStateLoading(bool? value) => super.noSuchMethod(
        Invocation.method(
          #setIsFormStateLoading,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setFormStatus(_i5.FormStatusEnum? status) => super.noSuchMethod(
        Invocation.method(
          #setFormStatus,
          [status],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<void> cancelForm({
    required _i7.JustificationEntity? justification,
    required String? formId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #cancelForm,
          [],
          {
            #justification: justification,
            #formId: formId,
          },
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> saveForm() => (super.noSuchMethod(
        Invocation.method(
          #saveForm,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> sendForm() => (super.noSuchMethod(
        Invocation.method(
          #sendForm,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> updateFormStatus({required _i5.FormStatusEnum? status}) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateFormStatus,
          [],
          {#status: status},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  void setFieldValue(
    String? sectionId,
    String? key,
    dynamic value,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #setFieldValue,
          [
            sectionId,
            key,
            value,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  dynamic getFieldValue(
    String? sectionId,
    String? key,
  ) =>
      super.noSuchMethod(Invocation.method(
        #getFieldValue,
        [
          sectionId,
          key,
        ],
      ));

  @override
  void addListener(_i8.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i8.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
