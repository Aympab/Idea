part of 'inscription_bloc.dart';

abstract class InscriptionState extends Equatable {
  const InscriptionState();
}

class InscriptionInitial extends InscriptionState {
  @override
  List<Object> get props => [];
}

class AddingNewUserState extends InscriptionState{


  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ErrorWhenAddingState extends InscriptionState{

}

classe NewUserAddedState extends InscriptionState{
  
}