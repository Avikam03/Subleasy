import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

class Dashboard extends StatefulWidget {

  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

 

class _DashboardState extends State<Dashboard> {
  // GoogleSignIn googleSignIn = GoogleSignIn(clientId: "12049475534-pd6lbbpsofo8h8otrbjf8flvvgm5d2pv.apps.googleusercontent.com");

  // GoogleSignInAccount? account;
  // late GoogleSignInAuthentication auth;
  // bool gotUser = false;

  

  // late Future<Object?> displayName =
  // FirebaseFirestore.instance
  //   .collection('users')
  //   .doc(FirebaseAuth.instance.currentUser?.uid)
  //   .get()
  //   .then((DocumentSnapshot documentSnapshot) {
  //       return documentSnapshot.data();

  // var currentUser = FirebaseAuth.instance.currentUser;

  String name = 'ok';

  @override
  void initState(){
    super.initState();
    // getCurrentUser();
    FirebaseFirestore.instance 
    .collection('users')
    .doc(FirebaseAuth.instance.currentUser?.uid)
    .get()
    .then((DocumentSnapshot documentSnapshot) {
      // return documentSnapshot.data();
      // print('Document data: ${documentSnapshot.data()}');
      setState(() {
        name = (documentSnapshot.data()! as Map)['name'];
      });
      
    });
  }

  // Map data = {};
  
  
  @override
  Widget build(BuildContext context) {

  

  print(name);
   

    // data = ModalRoute.of(context)?.settings.arguments as Map;
    
    // displayName = getName();

    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Dashboard',
          style: TextStyle(fontSize: 30),
          ),
          Text(name),
          // Text(displayName['name']),

          RaisedButton(
            child:
             const Text(
              "My Listings",
              style: TextStyle(
                fontSize: 22,
                // color: Color(0xff426BFF),
                color: Color(0xff000000)
              ),
            ),
            onPressed: (){
              // statrSignIn();
              Navigator.pushReplacementNamed(context, '/mylistings');
            }

          ),


          RaisedButton(
            onPressed: (){
              // statrSignIn();
              SignOut();
            }

          )
        ]
      )
    );
  }

  void SignOut() async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/');
  }

  // void getCurrentUser() {}
  

  

}

