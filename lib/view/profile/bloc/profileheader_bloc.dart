import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:idea/model/user.dart';
import 'package:idea/view/profile/profileMain.dart';


part 'profileheader_event.dart';
part 'profileheader_state.dart';

class ProfileHeaderBloc extends Bloc<ProfileHeaderEvent, ProfileHeaderState> {

  final User user;

  ProfileHeaderBloc(this.user);

  @override
  ProfileHeaderState get initialState => ProfileHeaderInitial(this.user);

  @override
  Stream<ProfileHeaderState> mapEventToState(
    ProfileHeaderEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if(event is NotConnectedProfile){
      yield ProfileHeaderInitial(this.user);
    }
    //FIXME :
    else if(event is TestEvent){
      yield TestState();
    }
  }
}
