import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:idea/model/ideaCategory.dart';
import 'package:idea/model/user.dart';
import 'package:idea/services/database.dart';
import 'package:idea/view/newIdea/secondPossiblePages/easyIdeaForm.dart';
import 'package:idea/view/newIdea/secondPossiblePages/widgetThirdPage.dart';
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
                                  if (_formKey.currentState.validate()) {
                                    print('validated');

                                    print(_ideaNameKey.currentState.ideaName);
                                    print(_descriptionKey
                                        .currentState.description);
                                    print(authUser.uid);
                                    _pvController.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInExpo);
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
          ThirdPageEasyIdea()
        ],
      ),
    );
  }
}

class ThirdPageEasyIdea extends StatefulWidget {
  const ThirdPageEasyIdea({
    Key key,
  }) : super(key: key);

  @override
  _ThirdPageEasyIdeaState createState() => _ThirdPageEasyIdeaState();
}

class _ThirdPageEasyIdeaState extends State<ThirdPageEasyIdea> {
  List<IdeaCategory> allCategories;
  bool _loading = true;
  // final suggestionsController = BehaviorSubject<List<String>>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => loadCategories(context));
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: SpinKitFadingCircle(
              color: Colors.white,
              size: 50.0,
            ),
          )
        : Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    TitleThirdPage(),
                    SizedBox(height: 10),
                    subtitleThirdPage(),
                    SizedBox(height: 30),
                    CategoriesTextField(
                      categories: allCategories,
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  loadCategories(BuildContext context) async {
    allCategories = await DatabaseService().getAllCategories();
    if (allCategories.length > 0) {
      setState(() {
        _loading = false;
      });
    }
  }
}
