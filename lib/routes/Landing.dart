import 'package:flutter/material.dart';
import './Login.dart';



class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Get Started'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
        ),
      ),
    );
  }
}