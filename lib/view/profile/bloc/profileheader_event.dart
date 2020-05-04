part of 'profileheader_bloc.dart';

abstract class ProfileHeaderEvent extends Equatable {
  const ProfileHeaderEvent();
}

class NotConnectedProfile extends ProfileHeaderEvent {
  final User userToDisplay;

  NotConnectedProfile(this.userToDisplay);

  @override
  List<Object> get props => [this.userToDisplay];
}

class TestEvent extends ProfileHeaderEvent{
  @override
  List<Object> get props => [];
}