import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



bool nullCheck(object){
  if(object == null){
    return false;
  }
  else{
    return true;
  }

}

class MyListings extends StatefulWidget {

  MyListings({Key? key}) : super(key: key);

  @override
  _MyListingsState createState() => _MyListingsState();
}

class _MyListingsState extends State<MyListings> {

  var currentUser = FirebaseAuth.instance.currentUser;
  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {



    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Your Listings',
          style: TextStyle(fontSize: 30, color: Color(0xff426BFF)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/createnew');
              ;},
            child: const Text('Create'),
          ),
        ]
      )
    );
  }

}

