import 'package:flutter/material.dart';
import 'package:idea/view/newIdea/secondPossiblePages/widgetsSecondPage.dart';

class FormNoDifficultyIdea extends StatefulWidget {
  final GlobalKey keyTFidea;
  final GlobalKey keyPicture;

  FormNoDifficultyIdea({
    Key key,
    @required GlobalKey<FormState> formKey,
    this.keyTFidea,
    @required this.keyPicture,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  _FormNoDifficultyIdeaState createState() => _FormNoDifficultyIdeaState();
}

class _FormNoDifficultyIdeaState extends State<FormNoDifficultyIdea> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 0);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget._formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Scrollbar(
            isAlwaysShown: true,
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFieldIdeaName(key: widget.keyTFidea),
                  ),
                  SizedBox(height: 40),
                  PictureField(
                    key: widget.keyPicture,
                  ),
                  SizedBox(height: 40)
                ],
              ),
            ),
          ),
        ));
  }
}
