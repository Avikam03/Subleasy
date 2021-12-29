import 'package:flutter/material.dart';

// new thing
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';




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


  // Map data = {'name': 'wowdoesntworkxd'};

  @override
  Widget build(BuildContext context) {

    // data = ModalRoute.of(context)?.settings.arguments as Map;

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
        // Navigator.pushReplacementNamed(context, '/dashboard', arguments:{
        //   'name': data['name'],
        // });
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
    });

  }
}