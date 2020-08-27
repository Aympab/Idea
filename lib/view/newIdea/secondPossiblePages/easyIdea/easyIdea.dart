import 'dart:math';
import 'package:flutter/material.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/view/newIdea/secondPossiblePages/easyIdea/easyIdeaForm.dart';
import 'package:idea/view/newIdea/secondPossiblePages/easyIdea/thirdPage.dart';
import 'package:idea/view/newIdea/secondPossiblePages/widgetsSecondPage.dart';

class InheritedCreateEasyIdea extends InheritedWidget {
  InheritedCreateEasyIdea({Key key}) : super(key: key, child: CreateEasyIdea());

  final Idea newIdea = Idea();

  static InheritedCreateEasyIdea of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedCreateEasyIdea>();
  //  {
  //   return (context.inheritFromWidgetOfExactType(InheritedCreateEasyIdea)as InheritedCreateEasyIdea);
  // }

  @override
  bool updateShouldNotify(InheritedCreateEasyIdea oldWidget) {
    return true;
  }
}

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
  GlobalKey<PictureFieldState> _pictureKey = GlobalKey<PictureFieldState>();

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
                        SizedBox(height: 5),
                        subtitleSecondPage(),
                        SizedBox(height: 30),
                        Expanded(
                          child: FormEasyIdea(
                            formKey: _formKey,
                            keyTfIdeaName: _ideaNameKey,
                            keyTfShortDescr: _descriptionKey,
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
                                  //Check if the user filled at least name and description
                                  if (_formKey.currentState.validate()) {
                                    InheritedCreateEasyIdea.of(context)
                                            .newIdea
                                            .title =
                                        _ideaNameKey.currentState.ideaName;

                                    InheritedCreateEasyIdea.of(context)
                                            .newIdea
                                            .shortDescription =
                                        _descriptionKey
                                            .currentState.description;

                                    InheritedCreateEasyIdea.of(context)
                                            .newIdea
                                            .imageFile =
                                        _pictureKey.currentState.ideaImage;

                                    _pvController.nextPage(
                                        duration: Duration(milliseconds: 500),
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
          ThirdPageIdea(
            newIdea: InheritedCreateEasyIdea.of(context).newIdea,
            difficultyLevel: 1,
          ),
        ],
      ),
    );
  }
}
