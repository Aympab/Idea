part of 'inscription_bloc.dart';

abstract class InscriptionEvent extends Equatable {
  const InscriptionEvent();
}

class AddNewUserEvent extends InscriptionEvent{

  User newUser;

  AddNewUserEvent({this.newUser});

  @override
  List<Object> get props => [this.newUser];
}
