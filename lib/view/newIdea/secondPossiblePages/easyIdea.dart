import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:idea/tools/themes.dart';

import 'package:idea/view/newIdea/newIdeaDifficulty.dart';
import 'package:idea/view/newIdea/secondPossiblePages/widgetsSecondPage.dart';
import 'package:provider/provider.dart';

class CreateEasyIdea extends StatefulWidget {
  CreateEasyIdea({Key key}) : super(key: key);

  @override
  _CreateEasyIdeaState createState() => _CreateEasyIdeaState();
}

class _CreateEasyIdeaState extends State<CreateEasyIdea> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<TextFieldIdeaNameState> _ideaNameKey =
      GlobalKey<TextFieldIdeaNameState>();
  GlobalKey<TextFieldShortDescriptionState> _descriptionKey =
      GlobalKey<TextFieldShortDescriptionState>();

  FormEasyIdea _form;

  @override
  Widget build(BuildContext context) {
    _form = FormEasyIdea(formKey: _formKey,keyTfIdeaName: _ideaNameKey,keyTfShortDescr: _descriptionKey,);

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
          child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  TitleSecondPage(),
                  subtitleSecondPage(),
                  SizedBox(height: 30),
                  Expanded(
                    child: _form,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(
                              'assets/images/buttonsImages/backWhite.png'),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: FlatButton(
                          onPressed: () {
                            //TODO : Enregistrer l'idée dans la BD
                            if (_formKey.currentState.validate()) {
                              print('validated');
                              print(_ideaNameKey.currentState.ideaName);
                              print(_descriptionKey.currentState.description);
                            } else {
                              print('not val');
                            }
                          },
                          child: Image.asset(
                              'assets/images/buttonsImages/nextWhite.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10)
                ],
              )),
        ),
      ),
    );
  }
}

class FormEasyIdea extends StatefulWidget {
  final GlobalKey keyTfShortDescr;
  final GlobalKey keyTfIdeaName;

  FormEasyIdea({
    Key key,
    @required GlobalKey<FormState> formKey,
    this.keyTfShortDescr,
    this.keyTfIdeaName,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  _FormEasyIdeaState createState() => _FormEasyIdeaState();
}

class _FormEasyIdeaState extends State<FormEasyIdea> {
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
                    child: TextFieldIdeaName(key: widget.keyTfIdeaName),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextFieldShortDescription(key: widget.keyTfShortDescr),
                  ),
                  SizedBox(height: 40),
                  PictureField(),
                  SizedBox(height: 40)
                ],
              ),
            ),
          ),
        ));
  }
}
