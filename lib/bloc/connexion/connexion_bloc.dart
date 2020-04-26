import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'connexion_event.dart';
part 'connexion_state.dart';

class ConnexionBloc extends Bloc<ConnexionEvent, ConnexionState> {
  @override
  ConnexionState get initialState => ConnexionInitial();

  @override
  Stream<ConnexionState> mapEventToState(
    ConnexionEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
