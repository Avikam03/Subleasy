import 'package:flutter/material.dart';
import './Login.dart';



class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
      home: SafeArea(
        child: Scaffold(

          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(),
              child: Center(
                child: Column(  
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 110),
                      child: Image.asset('assets/images/landing.png', scale: 2),

                      // child: const Image(
                      //   image: AssetImage('assets/images/landing.png'),
                      // ),
                    ),
                    Container(
                      width: 315.0,
                      height: 68.0,
                      decoration: const BoxDecoration(
                          color: Color(0xffF4F4F4),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: TextButton(
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 22,
                            // color: Color(0xff426BFF),
                            color: Color(0xff000000)
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/login',
                          );
                        }, 
                      )
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
