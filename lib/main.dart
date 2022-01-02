import 'package:flutter/material.dart';
import './routes/Splash.dart';
import './routes/Login.dart';
import './routes/Landing.dart';
import './routes/Dashboard.dart';
import './routes/MyListings.dart';
import './routes/CreateNew.dart';
import './routes/ViewListing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './routes/imageupload.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PartyLoo",
      
      theme: ThemeData(
      appBarTheme: const AppBarTheme(
     color: Color(0xFF426BFF),
  ),
      primaryColor: const Color(0xFF426BFF),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            
            primary: const Color(0xFF426BFF),
        ),
      ),
      ),
      
      routes: {
        /* '/': (context) => ImageUpload(), */

        '/' : (_)=>SplashScreen(),
        '/landing' : (_)=>Landing(),
        '/login' : (_)=>Login(),
        '/dashboard' : (_)=>Dashboard(),
        '/mylistings' : (_)=>MyListings(),
        '/createnew' : (_)=>CreateNew(),
      }
    );
  }
}
