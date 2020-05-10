import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/idea.dart';
import 'ideaInfosPage/ideaInfosPage.dart';

class InheritedIdea extends InheritedWidget {
  InheritedIdea({this.idea, Key key}) : super(key: key, child: IdeaView());

  final Idea idea;

  static InheritedIdea of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<InheritedIdea>());
  }

  @override
  bool updateShouldNotify(InheritedIdea oldWidget) {
    return true;
  }
}

class IdeaView extends StatelessWidget {
  const IdeaView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xF8EABF).withOpacity(1.0),
            // Colors.white,
            Color(0xFFC114).withOpacity(1.0),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: IdeaInfosPage(),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: buildColumnIcons(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ConstrainedBox buildColumnIcons(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: (MediaQuery.of(context).size.height / 5) >= 144
            ? (MediaQuery.of(context).size.height / 5)
            : 144,
        //Under 144 px, there is a pixel overflow
        minHeight: 144,
        maxWidth: 50,
      ),
      child: Column(
        children: <Widget>[
          OutlineButton(
            onPressed: () {},
            child: Icon(Icons.info_outline),
          ),
          OutlineButton(
            onPressed: () {},
            child: Icon(Icons.public),
          ),
          OutlineButton(
            onPressed: () {},
            child: Icon(Icons.message),
          ),
        ],
      ),
    );
  }
}
