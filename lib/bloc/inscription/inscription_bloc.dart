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
        if (user.infosOblig.pseudo.isEmpty | user.infosOblig.email.isEmpty |user.infosOblig.password.isEmpty){
          yield ErrorWhenAddingState();
        }
        //Si c'est bon, on yield le AddingUser, puis on ajoute l'user dans le BD, puis on yield le UserAdded
        else{
          yield AddingNewUserState();

          try{
            await addUserToDB(user);
            yield UserAddedState();
          }catch(e){
            yield ErrorWhenAddingState();
          }
        }    
      break;

      case CancelAddUserEvent :
        yield CancellingState();
      break;
    }


  }
}


Future<void> addUserToDB(User user) async{
  //TODO : Implement
}