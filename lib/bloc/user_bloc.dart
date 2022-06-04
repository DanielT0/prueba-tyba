import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurantes_app/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ActivateUser>( (event, emit ) => emit( UserSetState( event.user ) ));

    on<AddUser>((event, emit) {
        final usuarios = [...state.usuarios!, event.user];
    });
  }
}
