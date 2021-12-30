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
  String name = 'ok';

  @override
  void initState(){
    super.initState();

    FirebaseFirestore.instance 
    .collection('users')
    .doc(FirebaseAuth.instance.currentUser?.uid)
    .get()
    .then((DocumentSnapshot documentSnapshot) {
      setState(() {
        name = (documentSnapshot.data()! as Map)['name'];
      });
      
    });
  }  
  
  @override
  Widget build(BuildContext context) {

  print(name);
       
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Dashboard',
          style: TextStyle(fontSize: 30),
          ),
          Text(name),

          RaisedButton(
            child:
             const Text(
              "My Listings",
              style: TextStyle(
                fontSize: 22,
                color: Color(0xff000000)
              ),
            ),
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/mylistings');
            }
          ),


          RaisedButton(
            onPressed: (){
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
}