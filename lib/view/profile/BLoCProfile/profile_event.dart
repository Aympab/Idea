part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

//Un event pour chaque clic sur une page de l'onglet
class ClickInfos extends ProfileEvent{
  final User user;  

  ClickInfos(this.user);

  @override
  List<Object> get props => [this.user];
}

class ClickIdeas extends ProfileEvent{
  final User user;  

  ClickIdeas(this.user);

  @override
  List<Object> get props => [this.user];
}

class ClickSum extends ProfileEvent{
  final User user;  

  ClickSum(this.user);

  @override
  List<Object> get props => [this.user];
}

class ClickResources extends ProfileEvent{
  final User user;  

  ClickResources(this.user);

  @override
  List<Object> get props => [this.user];
}