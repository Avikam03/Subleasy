import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:intl.dart';

class DatabaseService {
  final String uid;
  final String ownName;
  final String communicatorName;

  DatabaseService({
    required this.uid,
    required this.ownName,
    required this.communicatorName,
  });

  Future updateData(String message) async {
    //final url = 'messages/$ownName/$communicatorName';
    final CollectionReference nameCollection = FirebaseFirestore.instance
        .collection('messages/$ownName/$communicatorName');

    return nameCollection
        .doc(DateTime.now().toString())
        .set({
          'MessageText': message,
          'MessageType': "sender",
        })
        .then((value) => print("Message Sent Successfully"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future updateForCommunicator(String message) async {
    //final url = 'messages/$ownName/$communicatorName';
    final CollectionReference nameCollection = FirebaseFirestore.instance
        .collection('messages/$communicatorName/$ownName');

    return nameCollection
        .doc(DateTime.now().toString())
        .set({
          'MessageText': message,
          'MessageType': "receiver",
        })
        .then((value) => print("Message Sent Successfully"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}

class UpdateStatus {
  final String own_uid;
  final String other_uid;

  UpdateStatus({required this.own_uid, required this.other_uid});

  Future updateStatusMessage(String message) async {
    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users/$own_uid/$own_uid');
    return userCollection
        .doc(other_uid)
        .update({'MessageText': message})
        .then((value) => print("Message Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
