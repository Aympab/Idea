import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/idea.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

class InheritedIdea extends InheritedWidget {
  InheritedIdea({this.idea, Key key, this.child})
      : super(key: key, child: child);

  final Widget child;

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
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: buildColumnIcons(context),
            ),
            Center(
              child: Title(
                color: Colors.amber,
                child: Text('Fusée'),
              ),
            ),
          ],
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
          FlatButton(
            onPressed: () {},
            child: Icon(Icons.info_outline),
          ),
          FlatButton(
            onPressed: () {},
            child: Icon(Icons.public),
          ),
          FlatButton(
            onPressed: () {},
            child: Icon(Icons.message),
          ),
        ],
      ),
    );
  }
}
