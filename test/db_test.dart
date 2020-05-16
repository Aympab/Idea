import 'package:flutter_test/flutter_test.dart';
import 'package:idea/launchingAppTest.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/services/database.dart';

void main() {
  test("test d'ajout d'une idée sur firestore'", () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    //Given : Une idée définie


    //Then : On va voir juste si elle s'est ajoutée sur firebase
    // expect(idea, DatabaseService().getIdeaWithName());
  });
}
