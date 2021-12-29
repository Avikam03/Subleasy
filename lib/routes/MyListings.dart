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

  // String name; 

  // Dashboard(this.name); 

  MyListings({Key? key}) : super(key: key);

  @override
  _MyListingsState createState() => _MyListingsState();
}

class _MyListingsState extends State<MyListings> {
  // GoogleSignIn googleSignIn = GoogleSignIn(clientId: "12049475534-pd6lbbpsofo8h8otrbjf8flvvgm5d2pv.apps.googleusercontent.com");

  // GoogleSignInAccount? account;
  // late GoogleSignInAuthentication auth;
  // bool gotUser = false;

  var currentUser = FirebaseAuth.instance.currentUser;
  // var currentUser = FirebaseAuth.instance.currentUser;
  @override
  void initState(){
    super.initState();
    // getCurrentUser();
  }


  @override
  Widget build(BuildContext context) {



    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Your Listings',
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

