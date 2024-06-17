// Mocks generated by Mockito 5.4.4 from annotations
// in formularios_front/test/app/presentation/stores/user_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:ui' as _i13;

import 'package:dartz/dartz.dart' as _i5;
import 'package:formularios_front/app/domain/entities/user_entity.dart' as _i11;
import 'package:formularios_front/app/domain/failures/failures.dart' as _i10;
import 'package:formularios_front/app/domain/repositories/user_repository.dart'
    as _i4;
import 'package:formularios_front/app/domain/usecases/login_user_usecase.dart'
    as _i9;
import 'package:formularios_front/app/presentation/user/stores/user_provider.dart'
    as _i12;
import 'package:gates_microapp_flutter/core/auth_controller.dart' as _i6;
import 'package:gates_microapp_flutter/domain/entities/logged_user_info.dart'
    as _i7;
import 'package:logger/logger.dart' as _i2;
import 'package:mobx/mobx.dart' as _i3;
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

class _FakeLogger_0 extends _i1.SmartFake implements _i2.Logger {
  _FakeLogger_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeReactiveContext_1 extends _i1.SmartFake
    implements _i3.ReactiveContext {
  _FakeReactiveContext_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIUserRepository_2 extends _i1.SmartFake
    implements _i4.IUserRepository {
  _FakeIUserRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_3<L, R> extends _i1.SmartFake implements _i5.Either<L, R> {
  _FakeEither_3(
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
class MockAuthController extends _i1.Mock implements _i6.AuthController {
  MockAuthController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Logger get logger => (super.noSuchMethod(
        Invocation.getter(#logger),
        returnValue: _FakeLogger_0(
          this,
          Invocation.getter(#logger),
        ),
      ) as _i2.Logger);

  @override
  set user(_i7.LoggedUserInfo? value) => super.noSuchMethod(
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
  _i3.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_1(
          this,
          Invocation.getter(#context),
        ),
      ) as _i3.ReactiveContext);

  @override
  void setUser(_i7.LoggedUserInfo? value) => super.noSuchMethod(
        Invocation.method(
          #setUser,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<void> signOut() => (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<bool> checkLogin() => (super.noSuchMethod(
        Invocation.method(
          #checkLogin,
          [],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
}

/// A class which mocks [LoginUserUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginUserUsecase extends _i1.Mock implements _i9.LoginUserUsecase {
  MockLoginUserUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.IUserRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeIUserRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.IUserRepository);

  @override
  _i8.Future<_i5.Either<_i10.Failure, _i11.UserEntity>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i8.Future<_i5.Either<_i10.Failure, _i11.UserEntity>>.value(
                _FakeEither_3<_i10.Failure, _i11.UserEntity>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i8.Future<_i5.Either<_i10.Failure, _i11.UserEntity>>);
}

/// A class which mocks [UserProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserProvider extends _i1.Mock implements _i12.UserProvider {
  MockUserProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set user(_i11.UserEntity? _user) => super.noSuchMethod(
        Invocation.setter(
          #user,
          _user,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get isLogged => (super.noSuchMethod(
        Invocation.getter(#isLogged),
        returnValue: false,
      ) as bool);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i8.Future<void> loginUser() => (super.noSuchMethod(
        Invocation.method(
          #loginUser,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void addListener(_i13.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i13.VoidCallback? listener) => super.noSuchMethod(
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
