import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';

import '../dbRequests.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  //Le state appelé en premier
  @override
  ProfileState get initialState => LoadingProfile();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    
    //User user = await getUserFromDB();

    switch (event.runtimeType) {
      case DisplayIdeas:
      yield DisplayingProfileIdeas((event as DisplayIdeas).user);
        break;
      case DisplayInfos:
      yield DisplayingProfileInfos((event as DisplayInfos).user);
        break;
      case DisplaySum:
      yield DisplayingProfileSum((event as DisplaySum).user);
        break;
      case DisplayResources:
      yield DisplayingProfileResources((event as DisplayResources).user);
        break;
      default:
        yield ProfileError("An error occured.");
    }
  }
}
