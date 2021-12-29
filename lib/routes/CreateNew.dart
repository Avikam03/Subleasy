import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CreateNew extends StatefulWidget {
  CreateNew({Key? key}) : super(key: key);

  @override
  _CreateNewState createState() => _CreateNewState();
}

class _CreateNewState extends State<CreateNew> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Create New Listing',
          style: TextStyle(fontSize: 30, color: Color(0xff426BFF)),
          ),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Title',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
            onPressed: (){
              createNewListing();
              ;},
            child: const Text('Create'),
          ),
        ]
      )
    );
  }

  void createNewListing() {
    FirebaseFirestore.instance.collection('listings')
    .add({
      'Images': {},
      'address' : "test",
      'city' : "test",
      'description': "test",
      'duration': 4,
      'endmonth': "test",
      'ownerid': "test",
      'price': "test",
      'startmonth': "test",
      'title': "test"
    })
    .then((value) => print("listing Added"))
    .catchError((err) => print("failed to add listing: $err"));

  }
}