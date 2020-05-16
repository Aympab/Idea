import 'dart:math';

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';
import 'package:idea/services/database.dart';
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

  DatabaseService _dbService = DatabaseService();

  PageController _pvController;
  @override
  void initState() {
    super.initState();
    _pvController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    _pvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User authUser = Provider.of<User>(context);

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
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pvController,
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: <Widget>[
                Positioned(
                  bottom: -60,
                  right: -60,
                  child: Transform.rotate(
                    angle: -pi / 4,
                    child: Container(
                        height: 200,
                        child:
                            Image.asset('assets/images/mainLightBulbLogo.png')),
                  ),
                ),
                SafeArea(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        TitleSecondPage(),
                        subtitleSecondPage(),
                        SizedBox(height: 30),
                        Expanded(
                          child: FormEasyIdea(
                            formKey: _formKey,
                            keyTfIdeaName: _ideaNameKey,
                            keyTfShortDescr: _descriptionKey,
                          ),
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
                                    print(_descriptionKey
                                        .currentState.description);
                                    print(authUser.uid);
                                    _pvController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInExpo);
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
                    ),
                  ),
                ),
              ],
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Text('yo'),
          )
        ],
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
                    child:
                        TextFieldShortDescription(key: widget.keyTfShortDescr),
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
