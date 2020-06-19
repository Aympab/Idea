import 'package:flutter/material.dart';
import 'package:idea/tools/themes.dart';
import 'package:provider/provider.dart';

class InheritedCreateNoPbIdea extends InheritedWidget {
  InheritedCreateNoPbIdea({Key key, this.child}) : super(key: key, child: CreateNoDifficultyIdea());

  final Widget child;

  static InheritedCreateNoPbIdea of(BuildContext context) => (context.dependOnInheritedWidgetOfExactType<InheritedCreateNoPbIdea>());

  @override
  bool updateShouldNotify( InheritedCreateNoPbIdea oldWidget) {
    return true;
  }
}

class CreateNoDifficultyIdea extends StatefulWidget {
  CreateNoDifficultyIdea({Key key}) : super(key: key);

  @override
  _CreateNoDifficultyIdeaState createState() => _CreateNoDifficultyIdeaState();
}

class _CreateNoDifficultyIdeaState extends State<CreateNoDifficultyIdea> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xb37636).withOpacity(1.0),
            Color(0xffe7ae).withOpacity(1.0),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Text('NoDifficulty',
              style: Provider.of<ThemeModel>(context).globalTextStyle),
        ),
      ),
    );
  }
}
