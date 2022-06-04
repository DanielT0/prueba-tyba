part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final User user;
  ActivateUser(this.user);
}

class AddUser extends UserEvent {
  final User user;
  AddUser(this.user);
}
