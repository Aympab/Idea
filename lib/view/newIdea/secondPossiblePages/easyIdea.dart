import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/model/ideaCategory.dart';
import 'package:idea/model/user.dart';
import 'package:idea/services/database.dart';
import 'package:idea/view/newIdea/secondPossiblePages/easyIdeaForm.dart';
import 'package:idea/view/newIdea/secondPossiblePages/widgetThirdPage.dart';
import 'package:idea/view/newIdea/secondPossiblePages/widgetsSecondPage.dart';
import 'package:provider/provider.dart';

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

///
///
///
///
///
///
///
///
///
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

  GlobalKey<SelectedCategoriesGridState> _categoryGridKey =
      GlobalKey<SelectedCategoriesGridState>();

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
                    SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          CategoriesTextField(
                            categories: allCategories,
                            colorRow1: Colors.lightGreen[100],
                            colorRow2: Colors.lightGreen[300],
                            categoryGridKey: _categoryGridKey,
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Catégories sélectionnées :',
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10),
                          SelectedCategoriesGrid(
                            key: _categoryGridKey,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Expanded(
                      child: Center(
                        child: ValidationButton(
                          categoryKey: _categoryGridKey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
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

class ValidationButton extends StatelessWidget {
  final GlobalKey<SelectedCategoriesGridState> categoryKey;
  const ValidationButton({
    Key key,
    @required this.categoryKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[500],
                offset: Offset(4.0, 4.0),
                blurRadius: 7.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-4.0, -4.0),
                blurRadius: 7.0,
                spreadRadius: 1.0),
          ]),
      child: IconButton(
        icon: Icon(Icons.public),
        onPressed: () async{
          InheritedCreateEasyIdea.of(context).newIdea.categories =
              categoryKey.currentState.selectedCategories;
          InheritedCreateEasyIdea.of(context).newIdea.advancement = 10;
          InheritedCreateEasyIdea.of(context).newIdea.supports = 1;

          InheritedCreateEasyIdea.of(context).newIdea.creator =
              Provider.of<User>(context, listen: false);

          InheritedCreateEasyIdea.of(context).newIdea.creator = await
              DatabaseService().getUserFromUid(
                  InheritedCreateEasyIdea.of(context).newIdea.creator.uid);
          print('soiree');
        },
      ),
    );
  }
}

class SelectedCategoriesGrid extends StatefulWidget {
  const SelectedCategoriesGrid({
    Key key,
  }) : super(key: key);

  @override
  SelectedCategoriesGridState createState() => SelectedCategoriesGridState();
}

class SelectedCategoriesGridState extends State<SelectedCategoriesGrid> {
  List<IdeaCategory> selectedCategories = List<IdeaCategory>();
  List<Widget> selectedCategoriesAsWidgets = List<Widget>();

  addOrRemoveCategory(IdeaCategory category) {
    bool adding = true;

    if (selectedCategories.contains(category)) {
      adding = false;
    }

    setState(() {
      if (adding) {
        selectedCategories.add(category);
      } else {
        selectedCategories.remove(category);
      }
    });
  }

  removeCategory(IdeaCategory category) {
    for (IdeaCategory currCategory in selectedCategories) {
      if (currCategory.name == category.name) {
        setState(() {
          selectedCategories.remove(category);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    selectedCategoriesAsWidgets = IdeaCategory.listToCard(
        selectedCategories, Colors.lightGreen[100], Colors.lightGreen[300],
        gridKey: widget.key);
    return selectedCategoriesAsWidgets.length == 0
        ? Text('Aucune')
        : Wrap(
            children: selectedCategoriesAsWidgets,
          );
  }
}
