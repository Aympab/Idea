part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

//Un event pour chaque clic sur une page de l'onglet
class DisplayInfos extends ProfileEvent {
  final User user;

  DisplayInfos(this.user);

  @override
  List<Object> get props => [];
}

class DisplayIdeas extends ProfileEvent {
  final User user;

  DisplayIdeas(this.user);
  @override
  List<Object> get props => [];
}

class DisplaySum extends ProfileEvent {
  final User user;

  DisplaySum(this.user);
  @override
  List<Object> get props => [];
}

class DisplayResources extends ProfileEvent {
  final User user;

  DisplayResources(this.user);
  @override
  List<Object> get props => [];
}
