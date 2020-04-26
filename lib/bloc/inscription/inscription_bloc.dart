import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:idea/model/user.dart';

part 'inscription_event.dart';
part 'inscription_state.dart';

class InscriptionBloc extends Bloc<InscriptionEvent, InscriptionState> {
  @override
  InscriptionState get initialState => InscriptionInitial();

  @override
  Stream<InscriptionState> mapEventToState(
    InscriptionEvent event,
  ) async* {
    // TODO: implement mapEventToState*

    
  }
}
