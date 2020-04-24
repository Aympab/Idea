import 'package:flutter/material.dart';
import 'package:idea/bloc/newIdea/newidea_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:idea/widget/expansionTileWidget.dart';

class NewIdeaView extends StatefulWidget {
  NewIdeaView({Key key}) : super(key: key);
  static String tag = 'new-idea';

  @override
  _NewIdeaViewState createState() => _NewIdeaViewState();
}

class _NewIdeaViewState extends State<NewIdeaView> {
  // Creation des données : Différentes Catégories
  var myCategorie_1 = {"value": 1, "name": "Espace"};
  var myCategorie_2 = {"value": 2, "name": "Futur"};
  var myCategorie_3 = {"value": 3, "name": "Mécanique"};
  var myCategorie_4 = {"value": 4, "name": "Jardinage"};
  var myCategorie_5 = {"value": 5, "name": "Technologie"};
  var myCategorie_6 = {"value": 6, "name": "Aviation"};

  var myCompetence_1 = {"value": 1, "name": "Bricolage"};
  var myCompetence_2 = {"value": 2, "name": "Jardinage"};
  var myCompetence_3 = {"value": 3, "name": "Mécano"};
  var myCompetence_4 = {"value": 4, "name": "Architecte"};
  var myCompetence_5 = {"value": 5, "name": "Gestion de Projet"};
  
  var myMateriel_1 = {"value": 1, "name": "Marteau"};
  var myMateriel_2 = {"value": 2, "name": "Imprimante 3D"};
  var myMateriel_3 = {"value": 3, "name": "Ciseaux"};
  var myMateriel_4 = {"value": 4, "name": "Tourne-vis"};
  var myMateriel_5 = {"value": 5, "name": "Métal"};

  List categorieListFunction (){
		List categorieList = List();
		categorieList.add(myCategorie_1);
		categorieList.add(myCategorie_2);
		categorieList.add(myCategorie_3);
		categorieList.add(myCategorie_4);
		categorieList.add(myCategorie_5);
		categorieList.add(myCategorie_6);
		return categorieList;
	}

  List competenceListFunction (){
		List competenceList = List();
		competenceList.add(myCompetence_1);
		competenceList.add(myCompetence_2);
		competenceList.add(myCompetence_3);
		competenceList.add(myCompetence_4);
		competenceList.add(myCompetence_5);
		return competenceList;
	}

  List materielListFunction (){
		List materielList = List();
		materielList.add(myMateriel_1);
		materielList.add(myMateriel_2);
		materielList.add(myMateriel_3);
		materielList.add(myMateriel_4);
		materielList.add(myMateriel_5);
		return materielList;
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Nouvelle Idée",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Image.asset('assets/logo.png'),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        //Ici on détermine quel méthode de build on va appeler en fonctoin du state
        child: BlocListener<NewideaBloc, NewideaState>(
          //Le listener permet d'ajouter des élements graphiques (on doit wrap with new widget le BlocCuilder)
          //Le listener return void
          //Le builder construit L'UI et est lancé plusieurs fois alros que le listener ne se lance qu'une fois pas changement d'état
          listener: (context, state) {},
          child: BlocBuilder<NewideaBloc, NewideaState>(
            builder: (BuildContext context, NewideaState state) {
              if (state is NewideaInitial) {
                return buildInitialInput();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    final separator = new Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: Colors.black,
              height: 50,
            )),
      )
    ]);

    final title = new Text(
      "Notez la maintenant...", 
      style: TextStyle(
        fontSize: 22,

      ),
    );

    comments (String text) {
      return new Align(
        alignment: Alignment.topLeft,
        child: Text(
          text, 
          style: TextStyle(
            fontStyle: FontStyle.italic,  
            color: Colors.black.withOpacity(0.6), 
            fontSize: 16,
          ),
        ),
      );
    }

    // Transformer en Widget : 
    final titleComment = new Text(
      "Avant qu'elle ne vous échappe", 
      style: TextStyle(
        fontStyle: FontStyle.italic,  
        color: Colors.black.withOpacity(0.6), 
        fontSize: 16,
      ),
    );

    final categorytitle = new Center( 
      child : Text(
      "Catégories", 
      style: Theme.of(context).textTheme.title)
      );

    final categorySelector = 
      MultiSelect(
          autovalidate: false,
          titleText: "Ajouter les Catégories de votre idée",
          validator: (value) {
            if (value == null) {
              return 'Please select one or more option(s)';
            }
          },
          errorText: 'Please select one or more option(s)',
          dataSource: categorieListFunction(),
          textField: 'name',
          valueField: 'value',
          filterable: true,
          required: true,
          value: null,
          change: (values) {
            //selectedCategories = values;
          },
        );

        final ideaName = new TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Nom',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        );

        final ideaDescription = new TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: 6,
          decoration: InputDecoration(
            hintText: 'max. 150 caractères',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        );

        final infoComponents = Column(
              children: [
                SizedBox(height: 20),
                comments("Comment appelez vous votre idée ?" ),
                SizedBox(height: 5),
                ideaName,
                SizedBox(height: 22),
                comments("Essayez de trouver une image !" ),
                SizedBox(height: 5),
                // Image 
                SizedBox(height: 22),
                comments("Décrivez brièvement votre idée" ),
                SizedBox(height: 5),
                ideaDescription,
                SizedBox(height: 5),
              ]
            
            );
        final competencesSelector = 
          MultiSelect(
              autovalidate: false,
              titleText: "Ajouter les compétences nécessaires",
              validator: (value) {
                if (value == null) {
                  return 'Please select one or more option(s)';
                }
              },
              errorText: 'Please select one or more option(s)',
              dataSource: competenceListFunction(),
              textField: 'name',
              valueField: 'value',
              filterable: true,
              required: true,
              value: null,
              change: (values) {
                //selectedCategories = values;
              },
            );
        final materielSelector = 
          MultiSelect(
              autovalidate: false,
              titleText: "Ajouter le matériel nécessaires",
              validator: (value) {
                if (value == null) {
                  return 'Please select one or more option(s)';
                }
              },
              errorText: 'Please select one or more option(s)',
              dataSource: materielListFunction(),
              textField: 'name',
              valueField: 'value',
              filterable: true,
              required: true,
              value: null,
              change: (values) {
                //selectedCategories = values;
              },
            );
        final contactSelector = 
          MultiSelect(
              autovalidate: false,
              titleText: "Ajouter les contacts nécessaires",
              validator: (value) {
                if (value == null) {
                  return 'Please select one or more option(s)';
                }
              },
              errorText: 'Please select one or more option(s)',
              dataSource: categorieListFunction(),
              textField: 'name',
              valueField: 'value',
              filterable: true,
              required: true,
              value: null,
              change: (values) {
                //selectedCategories = values;
              },
            );
        final besoinsComponents = Column(
              children: [
                SizedBox(height: 15),
                ExpansionTileWidget(
                  components : competencesSelector, 
                  name: "Compétences", myColor: 
                  Colors.blue),
                SizedBox(height: 15),
                ExpansionTileWidget(
                  components : materielSelector, 
                  name: "Matériels", myColor: 
                  Colors.purple), 
                SizedBox(height: 15),
                ExpansionTileWidget(
                  components : contactSelector, 
                  name: "Contacts", myColor: 
                  Colors.orange)
              ]
            
            );
        final globalInformations = ExpansionTileWidget(components : infoComponents, name: "Infos", myColor: Colors.grey[200]);
        final besoins = ExpansionTileWidget(components : besoinsComponents, name: "Besoins", myColor: Colors.grey[200]);
        int _value = 0;
        final ideaStatus = Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () => setState(() => _value = 0),
                  child: Container(
                    height: 56,
                    width: 56,
                    color: _value == 0 ? Colors.red : Colors.yellow,
                    child: Icon(Icons.call),
                  ),
                ),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: () => setState(() => _value = 1),
                  child: Container(
                    height: 56,
                    width: 56,
                    color: _value == 1 ? Colors.red : Colors.yellow,
                    child: Icon(Icons.message),
                  ),
                ),
              ],
            ),
          );
        final validationButton = FlatButton(
          child: Icon(Icons.check_box, color: Colors.green, size: 45,),
          onPressed: () {
            showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 30,
                      child: Container(
                        height: 260.0,
                        width: 360.0,
                        padding:
                            EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child: Text('statut'), //ideaStatus,
                      ),
                    );
                  });
          },
        );
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          title,
          SizedBox(height: 5),
          titleComment,
          SizedBox(height: 22),
          categorytitle, 
          SizedBox(height: 5),
          categorySelector,
          SizedBox(height: 25),
          globalInformations,
          SizedBox(height: 5),
          besoins,
          SizedBox(height: 20),
          validationButton
        ],)
    );
  }
}