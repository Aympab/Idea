import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';
import 'package:idea/view/profile/profileHeader.dart';
import 'package:idea/view/profile/profileTabs.dart';

class InheritedProfile extends InheritedWidget {
  final User user;
  
  InheritedProfile({@required this.user, Widget child}) : super(child: child);

  static InheritedProfile of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedProfile>();

  @override
  bool updateShouldNotify(InheritedProfile oldWidget) => true;
}

class ProfileView extends StatefulWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  ProfileViewState createState() => ProfileViewState();

}

//On a besoin du Mixin pour pouvoir gérer les scrolls multiples
class ProfileViewState extends State<ProfileView>
    with TickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    //On utilise des controllers pour gérer les différents scrolls
    _tabController =
        TabController(vsync: this, length: ProfileTabs.tabs.length);
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
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [_buildAppBar()];
        },
        body: ProfileTabs(),
      ),
    );
  }

  //La partie en tête
  Widget _buildAppBar() {
    return const SliverAppBar(
        backgroundColor: Colors.amber,
        floating: false,
        pinned: true,
        snap: false,
        expandedHeight: 300.0,
        flexibleSpace: ProfileHeader());
  }
}
