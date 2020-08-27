import 'dart:math';

import 'package:flutter/material.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/tools/themes.dart';
import 'package:idea/view/newIdea/secondPossiblePages/easyIdea/easyIdea.dart';
import 'package:idea/view/newIdea/secondPossiblePages/widgetsSecondPage.dart';
import 'package:provider/provider.dart';

import '../easyIdea/thirdPage.dart';
import 'noDifficultyIdeaForm.dart';

class InheritedCreateNoDiffIdea extends InheritedWidget {
  InheritedCreateNoDiffIdea({Key key})
      : super(key: key, child: CreateNoDifficultyIdea());

  final Idea newIdea = Idea();

  static InheritedCreateNoDiffIdea of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<InheritedCreateNoDiffIdea>());

  @override
  bool updateShouldNotify(InheritedCreateNoDiffIdea oldWidget) {
    return true;
  }
}

class CreateNoDifficultyIdea extends StatefulWidget {
  CreateNoDifficultyIdea({Key key}) : super(key: key);

  @override
  _CreateNoDifficultyIdeaState createState() => _CreateNoDifficultyIdeaState();
}

class _CreateNoDifficultyIdeaState extends State<CreateNoDifficultyIdea> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<TextFieldIdeaNameState> _ideaTextFieldKey =
      GlobalKey<TextFieldIdeaNameState>();
  GlobalKey<PictureFieldState> _pictureKey = GlobalKey<PictureFieldState>();

  PageController _pvController = PageController();

  // @override
  // void dispose() {
  //   _pvController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xb37636).withOpacity(1.0),
            Color(0xffe7ae).withOpacity(1.0),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pvController,
            children: <Widget>[
              Scaffold(
                resizeToAvoidBottomPadding: false,
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
                          child: Image.asset(
                              'assets/images/mainLightBulbLogo.png'),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 50),
                            TitleSecondPage(),
                            SizedBox(height: 5),
                            subtitleSecondPage(),
                            SizedBox(height: 30),
                            Expanded(
                              child: FormNoDifficultyIdea(
                                formKey: _formKey,
                                keyTFidea: _ideaTextFieldKey,
                                keyPicture: _pictureKey,
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
                                    child: Image.asset(
                                        'assets/images/buttonsImages/nextWhite.png'),
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        InheritedCreateNoDiffIdea.of(context)
                                                .newIdea
                                                .title =
                                            _ideaTextFieldKey
                                                .currentState.ideaName;

                                        InheritedCreateNoDiffIdea.of(context)
                                            .newIdea
                                            .shortDescription = "";

                                        InheritedCreateNoDiffIdea.of(context)
                                                .newIdea
                                                .imageFile =
                                            _pictureKey.currentState.ideaImage;

                                        _pvController.nextPage(
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.easeInExpo);
                                      }
                                    },
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
              ThirdPageEasyIdea()
            ],
          ),
        ),
      ),
    );
  }
}
