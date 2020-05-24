import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/model/ideaCategory.dart';
import 'package:idea/model/user.dart';
import 'package:idea/services/cloudStorageService.dart';
import 'package:idea/services/database.dart';
import 'package:idea/view/newIdea/secondPossiblePages/easyIdea/easyIdea.dart';
import 'package:idea/view/newIdea/secondPossiblePages/widgetThirdPage.dart';
import 'package:provider/provider.dart';

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
            resizeToAvoidBottomPadding: false,
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
                    Expanded(
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
                            style: TextStyle(fontFamily: 'BalsamiqSans'),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                                                      child: SingleChildScrollView(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: SelectedCategoriesGrid(
                                  key: _categoryGridKey,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: ValidationButton(
                        onPressed: () async {
                          setState(() {
                            _loading = true;
                          });

                          //Modification de l'iéde du inherited widget
                          InheritedCreateEasyIdea.of(context)
                                  .newIdea
                                  .categories =
                              _categoryGridKey.currentState.selectedCategories;

                          InheritedCreateEasyIdea.of(context)
                              .newIdea
                              .advancement = 10;
                          InheritedCreateEasyIdea.of(context).newIdea.supports =
                              1;

                          InheritedCreateEasyIdea.of(context).newIdea.creator =
                              Provider.of<User>(context, listen: false);

                          InheritedCreateEasyIdea.of(context).newIdea.creator =
                              await DatabaseService().getUserFromUid(
                                  InheritedCreateEasyIdea.of(context)
                                      .newIdea
                                      .creator
                                      .uid);

                          //Uploading the idea picture to storage
                          CloudStorageResult result =
                              await CloudStorageService().uploadImage(
                                  imageToUpload:
                                      InheritedCreateEasyIdea.of(context)
                                          .newIdea
                                          .imageFile,
                                  title: 'nomIdeaPicture');
                          //Setting the image URL of the idea
                          InheritedCreateEasyIdea.of(context).newIdea.imageURL =
                              result.imageUrl;

                          Idea newIdea =
                              InheritedCreateEasyIdea.of(context).newIdea;

                          //A partir d'ici on a une idée tout prête à partir en BD
                          await DatabaseService().createIdeaData(newIdea);
                          //TODO : Go to the new idea page
                          // Navigator.of(context).pushReplacementNamed('/ideaPage', arguments : newIdea);

                          Navigator.of(context).pushReplacementNamed('/flux');
                          print('soiree');
                        },
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
  final Function onPressed;

  const ValidationButton({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: RaisedButton(
        color: Colors.green,
        splashColor: Color(0xE1F2D4).withOpacity(1.0),
        shape: CircleBorder(
          side: BorderSide(color: Colors.black),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.public),
            SizedBox(height: 5),
            Text(
              'Publier',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
