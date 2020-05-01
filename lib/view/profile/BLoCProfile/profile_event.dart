part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

//Un event pour chaque clic sur une page de l'onglet
class ClickInfos extends ProfileEvent{
  @override
  List<Object> get props => [];
}

class ClickIdeas extends ProfileEvent{
  @override
  List<Object> get props => [];
}

class ClickSum extends ProfileEvent{
  @override
  List<Object> get props => [];
}

class ClickResources extends ProfileEvent{
  @override
  List<Object> get props => [];
}