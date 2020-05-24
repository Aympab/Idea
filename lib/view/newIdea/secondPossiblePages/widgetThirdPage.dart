import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/ideaCategory.dart';
import 'package:idea/services/database.dart';

///
///
///TITLE OF THE THIRD PAGE
///
///
///
class TitleThirdPage extends StatefulWidget {
  TitleThirdPage({Key key}) : super(key: key);

  @override
  _TitleThirdPageState createState() => _TitleThirdPageState();
}

class _TitleThirdPageState extends State<TitleThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 43.00,
          width: 43.00,
          decoration: BoxDecoration(
            color: Color(0xff91ccff),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              "3.",
              style: TextStyle(
                fontFamily: "ComingSoon",
                fontSize: 36,
                color: Color(0xff000000),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Card(
          elevation: 10,
          child: Material(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xff91ccff),
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              splashColor: Colors.blue,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(
                      "Catégories et tags",
                      style: TextStyle(
                        fontFamily: "ComingSoon",
                        fontSize: 24,
                        color: Color(0xff000000),
                      ),
                    ),
                    //TODO : EXPLIQUER LE CHIFFRE
                    content: Text(
                        'ICI METTRE UNE PETITE IMAGE DUNE CARD ET EXPLIQUER CE QUE CEST LE CHIFFRE'),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'))
                    ],
                    elevation: 24.0,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "Marquez",
                  style: TextStyle(
                    fontFamily: "BalsamiqSans",
                    fontSize: 24,
                    color: Color(0xff000000),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          " votre idée",
          style: TextStyle(
            fontFamily: "BalsamiqSans",
            fontSize: 24,
            color: Color(0xff000000),
          ),
        )
      ],
    );
  }
}

Widget subtitleThirdPage() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Text(
      "Grâce aux tags des catégories, votre idée pourra être facilement retrouvée par les autres idéateurs !",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "BalsamiqSans",
        fontStyle: FontStyle.italic,
        fontSize: 17,
        color: Colors.grey[700],
      ),
    ),
  );
}

///
///
///
///
///
///AUTOCOMPLETE TEXT FIELD
///FOR CATEGORIES
///
///
///
class CategoriesTextField extends StatefulWidget {
  final List<IdeaCategory> categories;
  final GlobalKey<SelectedCategoriesGridState> categoryGridKey;
  //The colors to altern each row
  final Color colorRow1;
  final Color colorRow2;

  CategoriesTextField(
      {Key key,
      this.categories,
      this.colorRow1,
      this.colorRow2,
      this.categoryGridKey})
      : super(key: key);

  @override
  _CategoriesTextFieldState createState() => _CategoriesTextFieldState();
}

class _CategoriesTextFieldState extends State<CategoriesTextField> {
  GlobalKey<AutoCompleteTextFieldState<IdeaCategory>> keyAutoComplete =
      new GlobalKey();
  TextEditingController textController = new TextEditingController();
  AutoCompleteTextField searchTextField;

  bool alternColor = false;
  @override
  Widget build(BuildContext context) {
    searchTextField = AutoCompleteTextField<IdeaCategory>(
//Stryle and shi
      suggestionsAmount: 10,
      controller: textController,
      style: TextStyle(color: Colors.black, fontSize: 20.0),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
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
        hintText: 'Ajouter une catégorie',
        hintStyle: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontFamily: 'BalsamiqSans'),
        errorStyle: TextStyle(color: Colors.red),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
      ),

      //Actual methods
      //
      itemBuilder: (BuildContext context, IdeaCategory suggestion) {
        //To altern colo
        alternColor = !alternColor;
        return Container(
          color: alternColor ? widget.colorRow1 : widget.colorRow2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                              child: Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    '${suggestion.name} ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text(
                  '${suggestion.popularity}',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
      itemFilter: (IdeaCategory suggestion, String query) {
        //TODO : Add better filters (like é and e)
        //TODO : If nothing, display top catégories
        return suggestion.name.toLowerCase().startsWith(query.toLowerCase());
      },
      itemSorter: (IdeaCategory a, IdeaCategory b) {
        return a.name.compareTo(b.name);
      },
      itemSubmitted: (IdeaCategory data) {
        // setState(() => searchTextField.textField.controller.text = data.name);
        widget.categoryGridKey.currentState.addOrRemoveCategory(data);
      },
      key: keyAutoComplete,
      suggestions: widget.categories,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 250), child: searchTextField),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: SubmitCategoryButton(
            categoryGridKey: widget.categoryGridKey,
            keyTextField: keyAutoComplete,
          ),
        )
      ],
    );
  }
}

///
///
///BUTTON SUBMIT CATEGORY (LINK IN A ROW WITH THE TEXT FIELD)
class SubmitCategoryButton extends StatefulWidget {
  final GlobalKey<AutoCompleteTextFieldState<IdeaCategory>> keyTextField;
  final GlobalKey<SelectedCategoriesGridState> categoryGridKey;

  const SubmitCategoryButton({
    Key key,
    @required this.keyTextField,
    @required this.categoryGridKey,
  }) : super(key: key);

  @override
  _SubmitCategoryButtonState createState() => _SubmitCategoryButtonState();
}

class _SubmitCategoryButtonState extends State<SubmitCategoryButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Color(0xff91ccff),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(
              "Proposer une catégorie",
              style: TextStyle(
                fontFamily: "BalsamiqSans",
                fontSize: 24,
                color: Color(0xff000000),
              ),
            ),
            content: Text(
              'Voulez vous proposer la catégorie "${widget.keyTextField.currentState.currentText}" à la communauté ? Une fois validée, celle-ci sera accessible à tout le monde dans le flux et les nouvelles idées.',
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () async {
                  IdeaCategory suggestedCategory = IdeaCategory(
                      name: widget.keyTextField.currentState.currentText,
                      popularity: 1);
                  //User suggests the category to the community
                  await DatabaseService().suggestCategory(
                    suggestedCategory,
                  );

                  //Then we add this category to the grid
                  if (widget.categoryGridKey != null)
                    widget.categoryGridKey.currentState
                        .addOrRemoveCategory(suggestedCategory);
                  // print(widget.keyTextField.currentState.currentText);
                  Navigator.of(context).pop();
                  widget.keyTextField.currentState.setState(() {
                    widget.keyTextField.currentState.controller.clear();
                    //  widget.keyTextField.currentState.currentText = '';
                  });
                },
                child: Text('Proposer ma catégorie !'),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Je vais réflechir'))
            ],
            elevation: 24.0,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: <Widget>[
            Icon(Icons.add_circle),
            Text(
              'Proposer',
              style: TextStyle(fontFamily: 'BalsamiqSans', fontSize: 12),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

///
///
///
///GRID OF THE SELECTED CAREGORIES
///
///
///
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
        ? Icon(Icons.more_horiz)
        : Wrap(
            children: selectedCategoriesAsWidgets,
          );
  }
}
