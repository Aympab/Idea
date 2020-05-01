part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class DisplayingProfileInfos extends ProfileState {
  final User user;

  DisplayingProfileInfos(this.user);  

  @override
  List<Object> get props => [this.user];
}

class DisplayingProfileIdeas extends ProfileState {
  final User user;

  DisplayingProfileIdeas(this.user);  

  @override
  List<Object> get props => [this.user];
}

class DisplayingProfileSum extends ProfileState {
  final User user;

  DisplayingProfileSum(this.user);  

  @override
  List<Object> get props => [this.user];
}

class DisplayingProfileResources extends ProfileState {
  final User user;

  DisplayingProfileResources(this.user);  

  @override
  List<Object> get props => [this.user];
}

class ProfileError extends ProfileState{
  final String errorMessage;
  final Icon errorIcon = Icons.error as Icon;

  ProfileError(this.errorMessage);

  @override
  List<Object> get props => [this.errorIcon, this.errorMessage];
}

class LoadingProfile extends ProfileState{
  @override
  List<Object> get props => [];
}