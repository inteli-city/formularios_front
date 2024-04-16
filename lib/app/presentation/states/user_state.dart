import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';

abstract class UserState {
  const UserState();
}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserErrorState extends UserState {
  final Failure error;

  const UserErrorState({required this.error});
}

class UserSuccessState extends UserState {
  final List<UserEntity> users;

  const UserSuccessState({required this.users});
}
