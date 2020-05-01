part of 'inscription_bloc.dart';

abstract class InscriptionState extends Equatable {
}

//Etat initial donc quand on arrive sur la page inscription et qu'on est en train d'entrer les données
class InscriptionInitial extends InscriptionState {
  @override
  List<Object> get props => null;
}

//Lorsqu'on clique sur le bouton créer un compte et qu'on est en train d'accéder à firebase etc, CHARGEMENT
class AddingNewUserState extends InscriptionState{
  final User user;

  AddingNewUserState({this.user});

  @override
  List<Object> get props => [this.user];
}

//Si on a une erreur lors de l'ajout
class ErrorWhenAddingState extends InscriptionState{
  final User user;
  final String messageErreur;

  ErrorWhenAddingState({this.user, this.messageErreur});

  @override
  List<Object> get props => [this.user, this.messageErreur];

}

//Quand l'user à bien été ajouté à la BD
class UserAddedState extends InscriptionState{
  final User user;

  UserAddedState({this.user});

  @override
  List<Object> get props => [this.user];  
}

class CancellingState extends InscriptionState{
  CancellingState();

  @override
  List<Object> get props => null;  
}