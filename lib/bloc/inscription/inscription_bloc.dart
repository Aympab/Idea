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
    switch(event.runtimeType){
      case AddNewUserEvent :
        User user = (event as AddNewUserEvent).newUser;

        //TODO : En fonction de ce qu'il manque comme data pour l'user on lance une erreur ou non
        
      break;

      case CancelAddUserEvent :
        yield CancellingState();
      break;
    }


  }
}
