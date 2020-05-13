import 'package:flutter/material.dart';

import 'package:idea/view/newIdea/newIdeaDifficulty.dart';

class CreateMediumIdea extends StatefulWidget {
  CreateMediumIdea({Key key}) : super(key: key);

  @override
  _CreateMediumIdeaState createState() => _CreateMediumIdeaState();
}

class _CreateMediumIdeaState extends State<CreateMediumIdea> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0x0097FE).withOpacity(1.0),
            Color(0xE3F2FE).withOpacity(1.0),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SafeArea(child: Text('Med', style: globalIdeaStyle)),
        ),
      ),
    );
  }
}
