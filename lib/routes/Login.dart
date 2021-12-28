import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// nice

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // GoogleSignIn googleSignIn = GoogleSignIn(clientId: "12049475534-pd6lbbpsofo8h8otrbjf8flvvgm5d2pv.apps.googleusercontent.com");

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Sign in with Google!",
          style: TextStyle(fontSize: 30),
          ),
          RaisedButton(
            onPressed: (){
              // statrSignIn();
              signInWithGoogle();
            }

          )
        ]
      )
    );
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // if (googleUser==null){
  //   //   print('Sign in Failed');
  //   // } else {
  //   //   Navigator.pushReplacementNamed(context, '/');
  //   // }

  //   return await FirebaseAuth.instance.signInWithCredential(credential);

  // }

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    if (googleUser==null){
      print('Sign in Failed');
    } else {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  

}
