import 'package:flutter/material.dart';

class DifficultyCard extends StatefulWidget {
  DifficultyCard({Key key}) : super(key: key);

  @override
  _DifficultyCardState createState() => _DifficultyCardState();
}

class _DifficultyCardState extends State<DifficultyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          width: 138,
          height: 38,
        ),
      ),
    );
  }
}
