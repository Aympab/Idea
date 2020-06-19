import 'package:flutter_test/flutter_test.dart';

void main() {
  test("test d'ajout d'une idée sur firestore'", () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    //Given : Une idée définie


    //Then : On va voir juste si elle s'est ajoutée sur firebase
    // expect(idea, DatabaseService().getIdeaWithName());
  });
}
