import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IdeaList extends StatefulWidget {
  @override
  _IdeaListState createState() => _IdeaListState();
}

class _IdeaListState extends State<IdeaList> {
  @override
  Widget build(BuildContext context) {
    final allIdeas = Provider.of<QuerySnapshot>(context);
    print(allIdeas);
    return Container();
  }
}
