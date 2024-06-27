// Mocks generated by Mockito 5.4.4 from annotations
// in formularios_front/test/app/presentation/form/pages/form_details_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:ui' as _i10;

import 'package:formularios_front/app/domain/entities/form_entity.dart' as _i3;
import 'package:formularios_front/app/domain/entities/justificative_entity.dart'
    as _i4;
import 'package:formularios_front/app/domain/entities/section_entity.dart'
    as _i12;
import 'package:formularios_front/app/domain/enum/form_status_enum.dart' as _i7;
import 'package:formularios_front/app/domain/enum/order_enum.dart' as _i9;
import 'package:formularios_front/app/domain/enum/priority_enum.dart' as _i11;
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart'
    as _i13;
import 'package:formularios_front/app/presentation/home/states/form_user_state.dart'
    as _i2;
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i8;

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

class _FakeFormUserState_0 extends _i1.SmartFake implements _i2.FormUserState {
  _FakeFormUserState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFormEntity_1 extends _i1.SmartFake implements _i3.FormEntity {
  _FakeFormEntity_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeJustificativeEntity_2 extends _i1.SmartFake
    implements _i4.JustificativeEntity {
  _FakeJustificativeEntity_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FormsProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockFormsProvider extends _i1.Mock implements _i5.FormsProvider {
  MockFormsProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FormUserState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeFormUserState_0(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.FormUserState);

  @override
  set state(_i2.FormUserState? _state) => super.noSuchMethod(
        Invocation.setter(
          #state,
          _state,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<String> get templates => (super.noSuchMethod(
        Invocation.getter(#templates),
        returnValue: <String>[],
      ) as List<String>);

  @override
  List<String> get streets => (super.noSuchMethod(
        Invocation.getter(#streets),
        returnValue: <String>[],
      ) as List<String>);

  @override
  List<String> get systems => (super.noSuchMethod(
        Invocation.getter(#systems),
        returnValue: <String>[],
      ) as List<String>);

  @override
  List<String> get cities => (super.noSuchMethod(
        Invocation.getter(#cities),
        returnValue: <String>[],
      ) as List<String>);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i3.FormEntity getFormByExternId(String? externId) => (super.noSuchMethod(
        Invocation.method(
          #getFormByExternId,
          [externId],
        ),
        returnValue: _FakeFormEntity_1(
          this,
          Invocation.method(
            #getFormByExternId,
            [externId],
          ),
        ),
      ) as _i3.FormEntity);

  @override
  void setState(_i2.FormUserState? value) => super.noSuchMethod(
        Invocation.method(
          #setState,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<void> fetchFormsLocally() => (super.noSuchMethod(
        Invocation.method(
          #fetchFormsLocally,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> syncForms() => (super.noSuchMethod(
        Invocation.method(
          #syncForms,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  String getFormsCountByStatus(_i7.FormStatusEnum? status) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFormsCountByStatus,
          [status],
        ),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.method(
            #getFormsCountByStatus,
            [status],
          ),
        ),
      ) as String);

  @override
  void filterForms({
    required String? template,
    required String? street,
    required String? city,
    required String? system,
    required _i7.FormStatusEnum? enumStatus,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #filterForms,
          [],
          {
            #template: template,
            #street: street,
            #city: city,
            #system: system,
            #enumStatus: enumStatus,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void orderForms(_i9.OrderEnum? orderEnum) => super.noSuchMethod(
        Invocation.method(
          #orderForms,
          [orderEnum],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i10.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i10.VoidCallback? listener) => super.noSuchMethod(
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

/// A class which mocks [FormEntity].
///
/// See the documentation for Mockito's code generation for more information.
class MockFormEntity extends _i1.Mock implements _i3.FormEntity {
  MockFormEntity() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get formTitle => (super.noSuchMethod(
        Invocation.getter(#formTitle),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#formTitle),
        ),
      ) as String);

  @override
  String get formId => (super.noSuchMethod(
        Invocation.getter(#formId),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#formId),
        ),
      ) as String);

  @override
  String get creatorUserId => (super.noSuchMethod(
        Invocation.getter(#creatorUserId),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#creatorUserId),
        ),
      ) as String);

  @override
  String get userId => (super.noSuchMethod(
        Invocation.getter(#userId),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#userId),
        ),
      ) as String);

  @override
  bool get canVinculate => (super.noSuchMethod(
        Invocation.getter(#canVinculate),
        returnValue: false,
      ) as bool);

  @override
  String get template => (super.noSuchMethod(
        Invocation.getter(#template),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#template),
        ),
      ) as String);

  @override
  String get area => (super.noSuchMethod(
        Invocation.getter(#area),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#area),
        ),
      ) as String);

  @override
  String get system => (super.noSuchMethod(
        Invocation.getter(#system),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#system),
        ),
      ) as String);

  @override
  String get street => (super.noSuchMethod(
        Invocation.getter(#street),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#street),
        ),
      ) as String);

  @override
  String get city => (super.noSuchMethod(
        Invocation.getter(#city),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#city),
        ),
      ) as String);

  @override
  int get number => (super.noSuchMethod(
        Invocation.getter(#number),
        returnValue: 0,
      ) as int);

  @override
  double get latitude => (super.noSuchMethod(
        Invocation.getter(#latitude),
        returnValue: 0.0,
      ) as double);

  @override
  double get longitude => (super.noSuchMethod(
        Invocation.getter(#longitude),
        returnValue: 0.0,
      ) as double);

  @override
  String get region => (super.noSuchMethod(
        Invocation.getter(#region),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#region),
        ),
      ) as String);

  @override
  _i11.PriorityEnum get priority => (super.noSuchMethod(
        Invocation.getter(#priority),
        returnValue: _i11.PriorityEnum.LOW,
      ) as _i11.PriorityEnum);

  @override
  _i7.FormStatusEnum get status => (super.noSuchMethod(
        Invocation.getter(#status),
        returnValue: _i7.FormStatusEnum.NOT_STARTED,
      ) as _i7.FormStatusEnum);

  @override
  set status(_i7.FormStatusEnum? _status) => super.noSuchMethod(
        Invocation.setter(
          #status,
          _status,
        ),
        returnValueForMissingStub: null,
      );

  @override
  int get expirationDate => (super.noSuchMethod(
        Invocation.getter(#expirationDate),
        returnValue: 0,
      ) as int);

  @override
  int get creationDate => (super.noSuchMethod(
        Invocation.getter(#creationDate),
        returnValue: 0,
      ) as int);

  @override
  _i4.JustificativeEntity get justificative => (super.noSuchMethod(
        Invocation.getter(#justificative),
        returnValue: _FakeJustificativeEntity_2(
          this,
          Invocation.getter(#justificative),
        ),
      ) as _i4.JustificativeEntity);

  @override
  List<_i12.SectionEntity> get sections => (super.noSuchMethod(
        Invocation.getter(#sections),
        returnValue: <_i12.SectionEntity>[],
      ) as List<_i12.SectionEntity>);

  @override
  set sections(List<_i12.SectionEntity>? _sections) => super.noSuchMethod(
        Invocation.setter(
          #sections,
          _sections,
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [SingleFormProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockSingleFormProvider extends _i1.Mock
    implements _i13.SingleFormProvider {
  MockSingleFormProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.FormEntity get form => (super.noSuchMethod(
        Invocation.getter(#form),
        returnValue: _FakeFormEntity_1(
          this,
          Invocation.getter(#form),
        ),
      ) as _i3.FormEntity);

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
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#creationDate),
        ),
      ) as String);

  @override
  String get expirationDate => (super.noSuchMethod(
        Invocation.getter(#expirationDate),
        returnValue: _i8.dummyValue<String>(
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
  void setFormStatus(_i7.FormStatusEnum? status) => super.noSuchMethod(
        Invocation.method(
          #setFormStatus,
          [status],
        ),
        returnValueForMissingStub: null,
      );

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
  _i6.Future<void> updateFormStatus({required _i7.FormStatusEnum? status}) =>
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
  void setIsSendingForm(bool? value) => super.noSuchMethod(
        Invocation.method(
          #setIsSendingForm,
          [value],
        ),
        returnValueForMissingStub: null,
      );

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
  void addListener(_i10.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i10.VoidCallback? listener) => super.noSuchMethod(
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
