import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class CloudStorageService {
  //TODO : Place image into a folder that is the pseudo's user and place image into this shit
  Future<CloudStorageResult> uploadImage({
    @required File imageToUpload,
    @required String title,
  }) async {
    //This will give a uid event if the title is the same for mutliple pictures
    var imageFileName =
        title + DateTime.now().millisecondsSinceEpoch.toString();

//This will find a place to store this uid with this child
    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imageFileName);

//This does the work, stores the result of putFile
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(imageToUpload);

//Gets a snapshot of the curretn storage
    StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;

    var downloadUrl = await storageSnapshot.ref.getDownloadURL();

    if (uploadTask.isComplete) {
      var url = downloadUrl.toString();
      return CloudStorageResult(
        imageUrl: url,
        imageFileName: imageFileName,
      );
    } else {
      return null;
    }
  }
}

class CloudStorageResult {
  final String imageUrl;
  final String imageFileName;

  CloudStorageResult({
    this.imageUrl,
    this.imageFileName,
  });
}
