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
                          onPressed: () async {
                            setState(() {
                              _loading = true;
                            });

                            //Modification de l'iéde du inherited widget
                            InheritedCreateEasyIdea.of(context)
                                    .newIdea
                                    .categories =
                                _categoryGridKey
                                    .currentState.selectedCategories;
                            InheritedCreateEasyIdea.of(context)
                                .newIdea
                                .advancement = 10;
                            InheritedCreateEasyIdea.of(context)
                                .newIdea
                                .supports = 1;

                            InheritedCreateEasyIdea.of(context)
                                    .newIdea
                                    .creator =
                                Provider.of<User>(context, listen: false);

                            InheritedCreateEasyIdea.of(context)
                                    .newIdea
                                    .creator =
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

                            InheritedCreateEasyIdea.of(context)
                                .newIdea
                                .imageURL = result.imageUrl;

                            Idea newIdea =
                                InheritedCreateEasyIdea.of(context).newIdea;

                            //A partir d'ici on a une idée tout prête à partir en BD
                            await DatabaseService().createIdeaData(newIdea);
                            //TODO : Go to idea page
                            Navigator.of(context).pushReplacementNamed('/flux');
                            print('soiree');
                          },
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
  final Function onPressed;

  const ValidationButton({
    Key key,
    @required this.categoryKey,
    this.onPressed,
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
        onPressed: onPressed,
      ),
    );
  }
}
