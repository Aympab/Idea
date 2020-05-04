import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idea/model/user.dart';
import 'package:idea/view/profile/profileHeader.dart';
import 'package:idea/view/profile/profileTabs.dart';
import 'package:idea/view/profile/bloc/profileheader_bloc.dart';

class InheritedProfile extends InheritedWidget {
  final User user;

  InheritedProfile({@required this.user, Widget child}) : super(child: child);

  static InheritedProfile of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedProfile>();

  @override
  bool updateShouldNotify(InheritedProfile oldWidget) => false;
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
    return SliverAppBar(
      //backgroundColor: Colors.amber,
      floating: false,
      pinned: true,
      snap: false,
      expandedHeight: 300.0,
      //TODO : Implement BLoC
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amberAccent, Colors.green[100]],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: ProfileHeader(
          displayedUser: InheritedProfile.of(context).user,
        ),
      ),
      // flexibleSpace: BlocProvider(
      //   create: (context) =>
      //       ProfileHeaderBloc(InheritedProfile.of(context).user),
      //   child: BlocBuilder<ProfileHeaderBloc, ProfileHeaderState>(
      //     builder: (context, state) {
      //       //Le builder peut être appelé plusieurs fois par build
      //       if (state is ProfileHeaderInitial) {
      //         return buildHeaderInitial(state.userToDisplay);
      //       } else if (state is TestState) {
      //         return buildTest();
      //       }
      //     },
      //   ),
      // ),
    );
  }
}

//TODO : C'est pour le BLoC ça faut l'enlever ou le mettre ailleurs
// buildHeaderInitial(User user) {
//   return FlexibleSpaceBar(
//     centerTitle: true,
//     title: Text(user.infosOblig.pseudo),
//     background: Center(
//       child: Column(
//         children: <Widget>[
//           CircularProfileAvatar(
//             "bolosse",
//             child: Icon(Icons.accessibility_new),
//           ),
//           FlatButton(
//             color: Colors.black,
//             onPressed: () {
//               print("Pressed !");
//             },
//             child: Text("Go to TestState"),
//           )
//         ],
//       ),
//     ),
//   );
// }

// buildTest() {
//   return FlexibleSpaceBar(
//     centerTitle: true,
//     title: Text("c'est un test"),
//     background: Center(
//       child: CircularProfileAvatar(
//         "bolosse",
//         child: Icon(Icons.accessibility_new),
//       ),
//     ),
//   );
// }
