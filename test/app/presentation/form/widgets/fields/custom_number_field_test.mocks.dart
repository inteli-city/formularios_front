// Mocks generated by Mockito 5.4.4 from annotations
// in formularios_front/test/app/presentation/form/widgets/fields/custom_number_field_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:formularios_front/app/domain/entities/form_entity.dart' as _i2;
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart'
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

/// A class which mocks [FormController].
///
/// See the documentation for Mockito's code generation for more information.
class MockFormController extends _i1.Mock implements _i3.FormController {
  MockFormController() {
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
  bool get isSendingForm => (super.noSuchMethod(
        Invocation.getter(#isSendingForm),
        returnValue: false,
      ) as bool);

  @override
  set isSendingForm(bool? _isSendingForm) => super.noSuchMethod(
        Invocation.setter(
          #isSendingForm,
          _isSendingForm,
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
  void setIsSendingForm(bool? value) => super.noSuchMethod(
        Invocation.method(
          #setIsSendingForm,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool getIsSendingForm() => (super.noSuchMethod(
        Invocation.method(
          #getIsSendingForm,
          [],
        ),
        returnValue: false,
      ) as bool);

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
}
