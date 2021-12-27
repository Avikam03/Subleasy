import 'package:flutter/material.dart';

// new thing
import 'package:firebase_auth/firebase_auth.dart';



class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    checkSignInStatus();
    super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Welcome!", 
            style: TextStyle(fontSize: 30),
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }


  void checkSignInStatus() async {
    FirebaseAuth.instance
    .authStateChanges()
    .listen((User? user) {
      if (user == null) {
        Navigator.pushReplacementNamed(context, '/landing');
      } else {
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
    });

  }
}