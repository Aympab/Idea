import 'package:flutter/material.dart';
import 'package:idea/tools/themes.dart';

import 'package:idea/view/newIdea/newIdeaDifficulty.dart';
import 'package:provider/provider.dart';

class CreateEasyIdea extends StatefulWidget {
  CreateEasyIdea({Key key}) : super(key: key);

  @override
  _CreateEasyIdeaState createState() => _CreateEasyIdeaState();
}

class _CreateEasyIdeaState extends State<CreateEasyIdea> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0x1B9200).withOpacity(1.0),
            Color(0xE1F2D4).withOpacity(1.0),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SafeArea(child: Text('Easy', style: Provider.of<ThemeModel>(context).globalTextStyle)),
        ),
      ),
    );
  }
}
