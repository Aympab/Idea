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

        //Si il manque des informations, on balance une erreur
        if (user.pseudo.isEmpty | user.email.isEmpty |user.password.isEmpty){
          yield ErrorWhenAddingState();
        }
        //Si c'est bon, on yield le AddingUser, puis on ajoute l'user dans le BD, puis on yield le UserAdded
        else{
          yield AddingNewUserState();
          await addUserToDB(user);
          yield UserAddedState();
        }        
        
      break;

      case CancelAddUserEvent :
        yield CancellingState();
      break;
    }


  }
}


void addUserToDB(User user) async{
  //TODO : Implement
}