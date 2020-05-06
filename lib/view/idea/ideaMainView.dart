import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/idea.dart';

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
        child: Text('page idée'),
      ),
    );
  }
}
