
import 'package:flutter/material.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/tools/themes.dart';
import 'package:idea/widget/expansionTileWidget.dart';
import 'package:idea/widget/multiSelect.dart';
import 'package:provider/provider.dart';

class NewIdeaView extends StatefulWidget {
  NewIdeaView({Key key}) : super(key: key);

  @override
  _NewIdeaViewState createState() => _NewIdeaViewState();
}

enum StatusValues { PRIVE, PUBLIC }

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

  var myContact_1 = {"value": 1, "name": "Chef de Projet informatique"};
  var myContact_2 = {"value": 2, "name": "Ingénieur Aéronautique"};
  var myContact_3 = {"value": 3, "name": "Architecte"};
  var myContact_4 = {"value": 4, "name": "Designer"};
  var myContact_5 = {"value": 5, "name": "Maçon"};
  var myContact_6 = {"value": 6, "name": "Pilote d'hélicoptère"};

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

  List contactListFunction (){
		List contactList = List();
		contactList.add(myContact_1);
		contactList.add(myContact_2);
		contactList.add(myContact_3);
		contactList.add(myContact_4);
		contactList.add(myContact_5);
		contactList.add(myContact_6);
		return contactList;
	}

  List selectedCategories = [];
  List selectedCompetences = [];
  List selectedMateriels = [];
  List selectedContacts = [];

  String selectedValue;
  @override
  void initState(){
    super.initState();
    selectedValue = "public";
  }

  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Une nouvelle idée ?"),
        leading: IconButton(
          icon: Image.asset('assets/logo.png'),
          onPressed: () {
            Provider.of<ThemeModel>(context, listen: false).toggleTheme();
          },
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        //Ici on détermine quel méthode de build on va appeler en fonctoin du state
        child: buildInitialInput(),
      ),
    );
  }

  Widget buildInitialInput() {

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

    final categorySelector = new MultiSelectWidget(titleMultiSelect: 'Ajouter les Catégories de votre idée', textFieldName: 'name', textFieldValue: 'value', objectList: categorieListFunction(), selectedvalues: selectedCategories, notifyParent: (List<dynamic> selectedvalues) {  },);

    final ideaName = new TextFormField(
      keyboardType: TextInputType.text,
      controller: nameController,
      decoration: InputDecoration(
        hintText: 'Nom',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final ideaDescription = new TextFormField(
      keyboardType: TextInputType.multiline,
      controller: descriptionController,
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
      final competenceSelector = new MultiSelectWidget(titleMultiSelect: 'Ajouter les compétences nécessaires', textFieldName: 'name', textFieldValue: 'value', objectList: competenceListFunction(), selectedvalues: selectedCompetences, notifyParent: (List<dynamic> selectedvalues) {  },);
      final materielSelector = new MultiSelectWidget(titleMultiSelect: 'Ajouter le matériel nécessaire', textFieldName: 'name', textFieldValue: 'value', objectList: materielListFunction(), selectedvalues: selectedMateriels, notifyParent: (List<dynamic> selectedvalues) {  },);
      final contactselector = new MultiSelectWidget(titleMultiSelect: 'Ajouter les contacts nécessaires', textFieldName: 'name', textFieldValue: 'value', objectList: contactListFunction(), selectedvalues: selectedContacts, notifyParent: (List<dynamic> selectedvalues) {  },);
      final besoinsComponents = Column(
            children: [
              SizedBox(height: 15),
              ExpansionTileWidget(
                components : Theme(data: ThemeData(primaryColor: Colors.blue), child: competenceSelector), 
                name: "Compétences", myColor: 
                Colors.blue),
              SizedBox(height: 15),
              ExpansionTileWidget(
                components : Theme(data: ThemeData(primaryColor: Colors.purple), child: materielSelector),
                name: "Matériels", myColor: 
                Colors.purple), 
              SizedBox(height: 15),
              ExpansionTileWidget(
                components : Theme(data: ThemeData(primaryColor: Colors.orange), child: contactselector), 
                name: "Contacts", myColor: 
                Colors.orange)
            ]
          
      );
      final globalInformations = ExpansionTileWidget(components : infoComponents, name: "Infos", myColor: Colors.grey[200]);
      final besoins = ExpansionTileWidget(components : besoinsComponents, name: "Besoins", myColor: Colors.grey[200]);
      final statustitle = new Center( 
      child : Text(
      "Status de l'idée", 
      style: Theme.of(context).textTheme.title)
      );
      setSelectedValue(String value) {
        setState(() {
          selectedValue = value;
        });
      }
      final ideaStatus2 = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          comments("Comment voulez vous enregistrer l'idée ?" ),
          RadioListTile(
            title: Text("Privé"),
            value: "prive", 
            groupValue: selectedValue, 
            activeColor: Colors.green,
            onChanged: (val) {
              print ("Radio $val");
              setSelectedValue(val);
            }
            ),
            RadioListTile(
              title : Text("Public"),
              value: "public", 
              groupValue: selectedValue, 
              activeColor: Colors.green,
              onChanged: (val) {
                print ("Radio $val");
                setSelectedValue(val);
              },
            ),
            
        ],
      );
    
      
        final validationButton = FlatButton(
          child: Icon(Icons.check_box, color: Colors.green, size: 45,),
          onPressed: (){
            print (selectedCategories);
            print (nameController.text.toString());
            print (descriptionController.text.toString());
            print (selectedCompetences);
            print (selectedMateriels);
            print (selectedContacts);
            print (selectedValue);
            Navigator.of(context).pushNamed('/ideaPage', arguments: Idea());
          }
            
        );
  
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xFFC114).withOpacity(1.0),
            Color(0xF8EABF).withOpacity(1.0),
          ],
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 10),
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
            statustitle,
            SizedBox(height: 5),
            ideaStatus2,
            SizedBox(height: 20),
            validationButton
          ],)
      ),
    );
  }
}