import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  // var currentUser = FirebaseAuth.instance.currentUser;
  // @override
  // void initState(){
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Dashboard',
          style: TextStyle(fontSize: 30),
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
  

}

