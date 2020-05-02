import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';
import 'package:idea/view/profile/profileHeader.dart';
import 'package:idea/view/profile/profileTabs.dart';

class ProfileView extends StatefulWidget {
  final User user;

  const ProfileView({Key key, this.user}) : super(key: key);

  @override
  ProfileViewState createState() => ProfileViewState();
}

//On a besoin du Mixin pour pouvoir gérer les scrolls multiples
class ProfileViewState extends State<ProfileView>
    with TickerProviderStateMixin {
  ProfileTabs _profileTabs;

  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    //On instancie ProfileTabs pour être sûr d'avoir la longueur des onglets
    _profileTabs = ProfileTabs();
    _tabController = TabController(vsync: this, length: ProfileTabs.tabs.length);
    _scrollController = new ScrollController();
  }

  @override
  void dispose() {
    //On pense à disposer les controller
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _profileTabs = ProfileTabs();

    return Scaffold(
      body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [_buildAppBar()];
          },
          body: _profileTabs),
    );
  }

  //La partie en tête
  Widget _buildAppBar() {
    return const SliverAppBar(
        floating: false,
        pinned: true,
        snap: false,
        expandedHeight: 300.0,
        flexibleSpace: ProfileHeader() 
        );
  }
}