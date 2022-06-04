part of 'user_bloc.dart';

@immutable
abstract class UserState {

  final bool existUser;
  final User? user;
  final List<User>? usuarios;

  const UserState({
    this.existUser = false, 
    this.user,
    this.usuarios,
  });

}

class UserInitialState extends UserState {
  const UserInitialState(): super( existUser: false, user: null ,usuarios: null );
}

class UserSetState extends UserState {
  final User newUser;
  const UserSetState(this.newUser)
    : super(existUser: true, user: newUser, usuarios:null );
}

