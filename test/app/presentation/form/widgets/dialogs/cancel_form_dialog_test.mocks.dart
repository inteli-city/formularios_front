// Mocks generated by Mockito 5.4.4 from annotations
// in formularios_front/test/app/presentation/form/widgets/dialogs/cancel_form_dialog_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:ui' as _i9;

import 'package:flutter/material.dart' as _i18;
import 'package:flutter_modular/flutter_modular.dart' as _i17;
import 'package:formularios_front/app/domain/entities/form_entity.dart' as _i2;
import 'package:formularios_front/app/domain/entities/justification_entity.dart'
    as _i8;
import 'package:formularios_front/app/domain/entities/section_entity.dart'
    as _i13;
import 'package:formularios_front/app/domain/entities/template_entity.dart'
    as _i14;
import 'package:formularios_front/app/domain/enum/form_status_enum.dart' as _i6;
import 'package:formularios_front/app/domain/enum/order_enum.dart' as _i12;
import 'package:formularios_front/app/domain/enum/priority_enum.dart' as _i15;
import 'package:formularios_front/app/presentation/form/controller/cancel_form_controller.dart'
    as _i16;
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart'
    as _i4;
import 'package:formularios_front/app/presentation/home/states/form_user_state.dart'
    as _i3;
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart'
    as _i10;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i11;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;

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

class _FakeFormUserState_1 extends _i1.SmartFake implements _i3.FormUserState {
  _FakeFormUserState_1(
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
    implements _i4.SingleFormProvider {
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
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#creationDate),
        ),
      ) as String);

  @override
  String get expirationDate => (super.noSuchMethod(
        Invocation.getter(#expirationDate),
        returnValue: _i5.dummyValue<String>(
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
  void setFormStatus(_i6.FormStatusEnum? status) => super.noSuchMethod(
        Invocation.method(
          #setFormStatus,
          [status],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Future<void> cancelForm({
    required _i8.JustificationEntity? justification,
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
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> saveForm() => (super.noSuchMethod(
        Invocation.method(
          #saveForm,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> sendForm() => (super.noSuchMethod(
        Invocation.method(
          #sendForm,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> updateFormStatus({required _i6.FormStatusEnum? status}) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateFormStatus,
          [],
          {#status: status},
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

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
  void addListener(_i9.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i9.VoidCallback? listener) => super.noSuchMethod(
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

/// A class which mocks [FormsProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockFormsProvider extends _i1.Mock implements _i10.FormsProvider {
  MockFormsProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.FormUserState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeFormUserState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.FormUserState);

  @override
  set state(_i3.FormUserState? _state) => super.noSuchMethod(
        Invocation.setter(
          #state,
          _state,
        ),
        returnValueForMissingStub: null,
      );

  @override
  int get pendingRequestsCount => (super.noSuchMethod(
        Invocation.getter(#pendingRequestsCount),
        returnValue: 0,
      ) as int);

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
  List<(_i2.FormEntity, _i11.LatLng)> get locations => (super.noSuchMethod(
        Invocation.getter(#locations),
        returnValue: <(_i2.FormEntity, _i11.LatLng)>[],
      ) as List<(_i2.FormEntity, _i11.LatLng)>);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i2.FormEntity getFormByExternId(String? externId) => (super.noSuchMethod(
        Invocation.method(
          #getFormByExternId,
          [externId],
        ),
        returnValue: _FakeFormEntity_0(
          this,
          Invocation.method(
            #getFormByExternId,
            [externId],
          ),
        ),
      ) as _i2.FormEntity);

  @override
  void setState(_i3.FormUserState? value) => super.noSuchMethod(
        Invocation.method(
          #setState,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Future<void> fetchFormsLocally() => (super.noSuchMethod(
        Invocation.method(
          #fetchFormsLocally,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> syncForms() => (super.noSuchMethod(
        Invocation.method(
          #syncForms,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  String getFormsCountByStatus(_i6.FormStatusEnum? status) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFormsCountByStatus,
          [status],
        ),
        returnValue: _i5.dummyValue<String>(
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
    required _i6.FormStatusEnum? enumStatus,
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
  void orderForms(_i12.OrderEnum? orderEnum) => super.noSuchMethod(
        Invocation.method(
          #orderForms,
          [orderEnum],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Future<_i2.FormEntity?> updateFormStatus({
    required String? formId,
    required _i6.FormStatusEnum? status,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateFormStatus,
          [],
          {
            #formId: formId,
            #status: status,
          },
        ),
        returnValue: _i7.Future<_i2.FormEntity?>.value(),
      ) as _i7.Future<_i2.FormEntity?>);

  @override
  _i7.Future<void> sendForm({
    required String? formId,
    required List<_i13.SectionEntity>? sections,
    String? vinculationFormId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendForm,
          [],
          {
            #formId: formId,
            #sections: sections,
            #vinculationFormId: vinculationFormId,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> saveForm({required _i2.FormEntity? form}) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveForm,
          [],
          {#form: form},
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> cancelForm({
    required _i8.JustificationEntity? justification,
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
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> createForm({
    required _i14.TemplateEntity? template,
    required String? area,
    required String? city,
    required String? street,
    required int? number,
    required double? latitude,
    required double? longitude,
    required String? region,
    required _i15.PriorityEnum? priority,
    required String? description,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createForm,
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
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  void addListener(_i9.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i9.VoidCallback? listener) => super.noSuchMethod(
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

/// A class which mocks [CancelFormController].
///
/// See the documentation for Mockito's code generation for more information.
class MockCancelFormController extends _i1.Mock
    implements _i16.CancelFormController {
  MockCancelFormController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set selectedImage(String? _selectedImage) => super.noSuchMethod(
        Invocation.setter(
          #selectedImage,
          _selectedImage,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set justificationText(String? _justificationText) => super.noSuchMethod(
        Invocation.setter(
          #justificationText,
          _justificationText,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set selectedOption(_i8.JustificationOptionEntity? _selectedOption) =>
      super.noSuchMethod(
        Invocation.setter(
          #selectedOption,
          _selectedOption,
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setSelectedOption(_i8.JustificationOptionEntity? option) =>
      super.noSuchMethod(
        Invocation.method(
          #setSelectedOption,
          [option],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setImage(String? value) => super.noSuchMethod(
        Invocation.method(
          #setImage,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setJustificationText(String? value) => super.noSuchMethod(
        Invocation.method(
          #setJustificationText,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setOption(_i8.JustificationOptionEntity? value) => super.noSuchMethod(
        Invocation.method(
          #setOption,
          [value],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [IModularNavigator].
///
/// See the documentation for Mockito's code generation for more information.
class MockIModularNavigator extends _i1.Mock implements _i17.IModularNavigator {
  MockIModularNavigator() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get path => (super.noSuchMethod(
        Invocation.getter(#path),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#path),
        ),
      ) as String);

  @override
  List<_i17.ParallelRoute<dynamic>> get navigateHistory => (super.noSuchMethod(
        Invocation.getter(#navigateHistory),
        returnValue: <_i17.ParallelRoute<dynamic>>[],
      ) as List<_i17.ParallelRoute<dynamic>>);

  @override
  _i7.Future<T?> push<T extends Object?>(_i18.Route<T>? route) =>
      (super.noSuchMethod(
        Invocation.method(
          #push,
          [route],
        ),
        returnValue: _i7.Future<T?>.value(),
      ) as _i7.Future<T?>);

  @override
  _i7.Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String? routeName, {
    TO? result,
    Object? arguments,
    bool? forRoot = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #popAndPushNamed,
          [routeName],
          {
            #result: result,
            #arguments: arguments,
            #forRoot: forRoot,
          },
        ),
        returnValue: _i7.Future<T?>.value(),
      ) as _i7.Future<T?>);

  @override
  _i7.Future<T?> pushNamed<T extends Object?>(
    String? routeName, {
    Object? arguments,
    bool? forRoot = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamed,
          [routeName],
          {
            #arguments: arguments,
            #forRoot: forRoot,
          },
        ),
        returnValue: _i7.Future<T?>.value(),
      ) as _i7.Future<T?>);

  @override
  _i7.Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String? newRouteName,
    bool Function(_i18.Route<dynamic>)? predicate, {
    Object? arguments,
    bool? forRoot = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [
            newRouteName,
            predicate,
          ],
          {
            #arguments: arguments,
            #forRoot: forRoot,
          },
        ),
        returnValue: _i7.Future<T?>.value(),
      ) as _i7.Future<T?>);

  @override
  _i7.Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String? routeName, {
    TO? result,
    Object? arguments,
    bool? forRoot = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushReplacementNamed,
          [routeName],
          {
            #result: result,
            #arguments: arguments,
            #forRoot: forRoot,
          },
        ),
        returnValue: _i7.Future<T?>.value(),
      ) as _i7.Future<T?>);

  @override
  void pop<T extends Object?>([T? result]) => super.noSuchMethod(
        Invocation.method(
          #pop,
          [result],
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool canPop() => (super.noSuchMethod(
        Invocation.method(
          #canPop,
          [],
        ),
        returnValue: false,
      ) as bool);

  @override
  _i7.Future<bool> maybePop<T extends Object?>([T? result]) =>
      (super.noSuchMethod(
        Invocation.method(
          #maybePop,
          [result],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);

  @override
  void popUntil(bool Function(_i18.Route<dynamic>)? predicate) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void navigate(
    String? path, {
    dynamic arguments,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #navigate,
          [path],
          {#arguments: arguments},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setObservers(List<_i18.NavigatorObserver>? navigatorObservers) =>
      super.noSuchMethod(
        Invocation.method(
          #setObservers,
          [navigatorObservers],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setNavigatorKey(_i18.GlobalKey<_i18.NavigatorState>? navigatorkey) =>
      super.noSuchMethod(
        Invocation.method(
          #setNavigatorKey,
          [navigatorkey],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i9.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i9.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
}
