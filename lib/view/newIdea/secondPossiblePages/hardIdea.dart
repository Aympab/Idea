import 'package:flutter/material.dart';

import 'package:idea/view/newIdea/newIdeaDifficulty.dart';

class CreateHardIdea extends StatefulWidget {
  CreateHardIdea({Key key}) : super(key: key);

  @override
  _CreateHardIdeaState createState() => _CreateHardIdeaState();
}

class _CreateHardIdeaState extends State<CreateHardIdea> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xFF5437).withOpacity(1.0),
            Color(0xFFE7E6).withOpacity(1.0),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SafeArea(child: Text('Hard', style: globalIdeaStyle)),
        ),
      ),
    );
  }
}
