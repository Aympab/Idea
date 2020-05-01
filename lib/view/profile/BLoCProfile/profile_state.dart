part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class DisplayProfileInfos extends ProfileState {
  final User user;

  DisplayProfileInfos(this.user);  

  @override
  List<Object> get props => [this.user];
}

class DisplayProfileIdeas extends ProfileState {
  final User user;

  DisplayProfileIdeas(this.user);  

  @override
  List<Object> get props => [this.user];
}

class DisplayProfileSum extends ProfileState {
  final User user;

  DisplayProfileSum(this.user);  

  @override
  List<Object> get props => [this.user];
}

class DisplayProfileResources extends ProfileState {
  final User user;

  DisplayProfileResources(this.user);  

  @override
  List<Object> get props => [this.user];
}

