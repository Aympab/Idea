import 'package:flutter/material.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/services/database.dart';
import 'package:idea/view/loadingScreen.dart';
import 'package:provider/provider.dart';

class IdeaList extends StatefulWidget {
  @override
  _IdeaListState createState() => _IdeaListState();
}

class _IdeaListState extends State<IdeaList> {
  @override
  Widget build(BuildContext context) {
    final allIdeas = Provider.of<List<Idea>>(context);

    return allIdeas == null ? LoadingScreen() : ListView.builder(
        itemCount: allIdeas.length,
        itemBuilder: (context, index) {
          return IdeaCard(idea: allIdeas[index]);
        });
  }
}
