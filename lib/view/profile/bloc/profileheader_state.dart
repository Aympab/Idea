part of 'profileheader_bloc.dart';

abstract class ProfileHeaderState extends Equatable {
  const ProfileHeaderState();
}

class ProfileHeaderInitial extends ProfileHeaderState {
  final User userToDisplay;

  ProfileHeaderInitial(this.userToDisplay);

  @override
  List<Object> get props => [this.userToDisplay];
}

class TestState extends ProfileHeaderState{
  @override
  List<Object> get props => [];
}