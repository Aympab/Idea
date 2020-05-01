part of 'inscription_bloc.dart';

abstract class InscriptionEvent extends Equatable {
  const InscriptionEvent();
}

//On clique sur ajouter un nouvel user
class AddNewUserEvent extends InscriptionEvent{
  final User newUser;

  AddNewUserEvent({this.newUser});

  @override
  List<Object> get props => [this.newUser];
}

//Quand on annule la création
class CancelAddUserEvent extends InscriptionEvent{
  CancelAddUserEvent();

  @override
  List<Object> get props => null;
}
