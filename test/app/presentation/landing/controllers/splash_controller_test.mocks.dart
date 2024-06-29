// Mocks generated by Mockito 5.4.4 from annotations
// in formularios_front/test/app/presentation/landing/controllers/splash_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i10;

import 'package:flutter/material.dart' as _i9;
import 'package:flutter_modular/flutter_modular.dart' as _i6;
import 'package:flutter_modular/src/presenter/models/route.dart' as _i8;
import 'package:formularios_front/app/domain/entities/user_entity.dart' as _i12;
import 'package:formularios_front/app/presentation/user/stores/user_provider.dart'
    as _i11;
import 'package:gates_microapp_flutter/core/auth_controller.dart' as _i3;
import 'package:gates_microapp_flutter/domain/entities/logged_user_info.dart'
    as _i4;
import 'package:mobx/mobx.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

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

class _FakeReactiveContext_0 extends _i1.SmartFake
    implements _i2.ReactiveContext {
  _FakeReactiveContext_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthController].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthController extends _i1.Mock implements _i3.AuthController {
  MockAuthController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set user(_i4.LoggedUserInfo? value) => super.noSuchMethod(
        Invocation.setter(
          #user,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get isLogged => (super.noSuchMethod(
        Invocation.getter(#isLogged),
        returnValue: false,
      ) as bool);

  @override
  _i2.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_0(
          this,
          Invocation.getter(#context),
        ),
      ) as _i2.ReactiveContext);

  @override
  void setUser(_i4.LoggedUserInfo? value) => super.noSuchMethod(
        Invocation.method(
          #setUser,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<void> signOut() => (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<bool> checkLogin() => (super.noSuchMethod(
        Invocation.method(
          #checkLogin,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [IModularNavigator].
///
/// See the documentation for Mockito's code generation for more information.
class MockIModularNavigator extends _i1.Mock implements _i6.IModularNavigator {
  MockIModularNavigator() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get path => (super.noSuchMethod(
        Invocation.getter(#path),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#path),
        ),
      ) as String);

  @override
  List<_i8.ParallelRoute<dynamic>> get navigateHistory => (super.noSuchMethod(
        Invocation.getter(#navigateHistory),
        returnValue: <_i8.ParallelRoute<dynamic>>[],
      ) as List<_i8.ParallelRoute<dynamic>>);

  @override
  _i5.Future<T?> push<T extends Object?>(_i9.Route<T>? route) =>
      (super.noSuchMethod(
        Invocation.method(
          #push,
          [route],
        ),
        returnValue: _i5.Future<T?>.value(),
      ) as _i5.Future<T?>);

  @override
  _i5.Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
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
        returnValue: _i5.Future<T?>.value(),
      ) as _i5.Future<T?>);

  @override
  _i5.Future<T?> pushNamed<T extends Object?>(
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
        returnValue: _i5.Future<T?>.value(),
      ) as _i5.Future<T?>);

  @override
  _i5.Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String? newRouteName,
    bool Function(_i9.Route<dynamic>)? predicate, {
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
        returnValue: _i5.Future<T?>.value(),
      ) as _i5.Future<T?>);

  @override
  _i5.Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
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
        returnValue: _i5.Future<T?>.value(),
      ) as _i5.Future<T?>);

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
  _i5.Future<bool> maybePop<T extends Object?>([T? result]) =>
      (super.noSuchMethod(
        Invocation.method(
          #maybePop,
          [result],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  void popUntil(bool Function(_i9.Route<dynamic>)? predicate) =>
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
  void setObservers(List<_i9.NavigatorObserver>? navigatorObservers) =>
      super.noSuchMethod(
        Invocation.method(
          #setObservers,
          [navigatorObservers],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setNavigatorKey(_i9.GlobalKey<_i9.NavigatorState>? navigatorkey) =>
      super.noSuchMethod(
        Invocation.method(
          #setNavigatorKey,
          [navigatorkey],
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
}

/// A class which mocks [UserProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserProvider extends _i1.Mock implements _i11.UserProvider {
  MockUserProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set user(_i12.UserEntity? _user) => super.noSuchMethod(
        Invocation.setter(
          #user,
          _user,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i5.Future<void> loadUser() => (super.noSuchMethod(
        Invocation.method(
          #loadUser,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  void logout() => super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
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
