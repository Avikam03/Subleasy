import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';


// nice

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // GoogleSignIn googleSignIn = GoogleSignIn(clientId: "12049475534-pd6lbbpsofo8h8otrbjf8flvvgm5d2pv.apps.googleusercontent.com");
  String? name = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Log In",
          style:
           TextStyle(fontSize: 30, color: Color(0xff426BFF), fontWeight: FontWeight.bold)
           
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            // child: const Image(
            //   image: AssetImage('assets/images/login.png'),
            // ),
            child: Image.asset('assets/images/login.png', scale: 1.5)
          ),
          RaisedButton(
            child:
             const Text(
              "Sign in with Google",
              style: TextStyle(
                fontSize: 22,
                // color: Color(0xff426BFF),
                color: Color(0xff000000)
              ),
            ),
            onPressed: (){
              // statrSignIn();
              signInWithGoogle();
            }

          )
        ]
      )
    );
  }

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // print(googleUser?.displayName);
    // print(googleUser?.email);

    setState(() {
      name = googleUser?.displayName;
    });

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    FirebaseFirestore.instance
    .collection('users')
    .doc(FirebaseAuth.instance.currentUser?.uid)
    .get()
    .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
          print("welcome back lmao");
      }
      else{
        FirebaseFirestore.instance.collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
            'name': name,
            'email': googleUser?.email,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      }
    });

    // Future<QuerySnapshot<Map<String, dynamic>>> currentusercheck =
    // FirebaseFirestore.instance
    // .collection('users')
    // .where('email'==googleUser?.email)
    // .get();
    // Future<dynamic>

    // if (currentusercheck == null){
    //   FirebaseFirestore.instance.collection('users')
    //   .add({
    //     'name': name,
    //     'email': googleUser?.email,
    //   })
    //   .then((value) => print("User Added"))
    //   .catchError((error) => print("Failed to add user: $error"));
    // }  

    // FirebaseFirestore.instance.collection('users')
    // .add({
    //   'name': name,
    //   'email': googleUser?.email,
    // })
    // .then((value) => print("User Added"))
    // .catchError((error) => print("Failed to add user: $error"));

    if (googleUser==null){
      print('Sign in Failed');
    } else {
      // Navigator.pushReplacementNamed(context, '/', arguments: {
      //   'name': name
      // });
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  

}
