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

  String _ideaName = '';

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
          child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  TitleSecondPage(),
                  subtitleSecondPage(),
                  SizedBox(height: 50),
                  Expanded(
                    child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: "ComingSoon",
                                    fontSize: 26,
                                    color: Color(0xFF000000),
                                  ),
                                  onChanged: (value) {
                                    setState(() => _ideaName = value);
                                  },
                                  validator: (value) => value.isNotEmpty &&
                                          value.length <= 30
                                      ? null
                                      : 'Entrez un nom de max. 30 caractères',
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC114).withOpacity(1.0),
                                        width: 5,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 2,
                                      ),
                                    ),
                                    fillColor: Color(0x1B9200).withOpacity(0.2),
                                    filled: true,
                                    hintText: 'Trouvez un nom à votre idée !',
                                    hintStyle: TextStyle(fontSize: 15),
                                    errorStyle: TextStyle(color: Colors.red),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  Row(
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
                            } else {
                              print('not val');
                            }
                          },
                          child: Image.asset(
                              'assets/images/buttonsImages/nextWhite.png'),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
