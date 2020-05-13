part of 'newidea_bloc.dart';

abstract class NewideaState extends Equatable {
  const NewideaState();
}

class NewideaInitial extends NewideaState {
  @override
  List<Object> get props => [];
}
