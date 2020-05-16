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
      crossAxisAlignment: CrossAxisAlignment.end,
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
        InkWell(
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
                //TODO : Write a little tutorial about what are difficulties (export widget)
                content: Text('Blablabla'),
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
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  // offset: Offset(5, 5),
                  blurRadius: 2,
                  color: Color(0xff91ccff),
                ),
              ],
            ),
            child: Text(
              "Marquez",
              style: TextStyle(
                fontFamily: "ComingSoon",
                fontSize: 24,
                color: Color(0xff000000),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        Text(
          " votre idée",
          style: TextStyle(
            fontFamily: "ComingSoon",
            fontSize: 24,
            color: Color(0xff000000),
          ),
        )
      ],
    );
  }
}

BorderedText subtitleThirdPage() {
  return BorderedText(
      strokeColor: Colors.black.withOpacity(0.8),
      strokeWidth: 0.8,
      child: new Text(
        "Grâce aux tags des catégories, votre idée pourra être facilement retrouvée par les autres idéateurs !",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "ComingSoon",
          fontSize: 15,
          color: Color(0xff9e9e9e),
        ),
      ));
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
  
  CategoriesTextField({Key key, this.categories}) : super(key: key);

  @override
  _CategoriesTextFieldState createState() => _CategoriesTextFieldState();
}

class _CategoriesTextFieldState extends State<CategoriesTextField> {
  GlobalKey<AutoCompleteTextFieldState<IdeaCategory>> keyAutoComplete =
      new GlobalKey();
  TextEditingController textController = new TextEditingController();
  AutoCompleteTextField searchTextField;

  @override
  Widget build(BuildContext context) {
    searchTextField = AutoCompleteTextField<IdeaCategory>(
      controller: textController,
      style: new TextStyle(color: Colors.black, fontSize: 16.0),
      decoration: new InputDecoration(
          suffixIcon: Container(
            width: 85.0,
            height: 60.0,
          ),
          contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
          filled: true,
          hintText: 'Ajouter une catégorie',
          hintStyle: TextStyle(color: Colors.black)),
      itemBuilder: (BuildContext context, IdeaCategory suggestion) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '${suggestion.name} (${suggestion.popularity})',
              style: TextStyle(fontSize: 16.0),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
            ),
            Text(
              suggestion.name,
            )
          ],
        );
      },
      itemFilter: (IdeaCategory suggestion, String query) {
        return suggestion.name.toLowerCase().startsWith(query.toLowerCase());
      },
      itemSorter: (IdeaCategory a, IdeaCategory b) {
        return a.name.compareTo(b.name);
      },
      itemSubmitted: (IdeaCategory data) {
        setState(() => searchTextField.textField.controller.text = data.name);
      },
      key: keyAutoComplete,
      suggestions: widget.categories,
    );

    return Container(child: searchTextField);
  }
}
