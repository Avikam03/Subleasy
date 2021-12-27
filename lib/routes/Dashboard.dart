import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  GoogleSignIn googleSignIn = GoogleSignIn(clientId: "12049475534-pd6lbbpsofo8h8otrbjf8flvvgm5d2pv.apps.googleusercontent.com");

  GoogleSignInAccount? account;
  late GoogleSignInAuthentication auth;
  bool gotUser = false;

  @override
  void initState(){
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return gotUser
        ? Scaffold(
            appBar: AppBar(
              title: const Text(" Your Profile "),
              centerTitle: true,
              actions: [
                IconButton(
                    icon: const Icon(Icons.exit_to_app),
                    onPressed: () async {
                      await googleSignIn.signOut();
                      await googleSignIn.disconnect();
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false);
                    })
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Name: ${account?.displayName}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  "Email: ${account?.email}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  "ID: ${account?.id}",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          )
        : LinearProgressIndicator();
  }

  void getUser() async {
    // account = googleSignIn.currentUser;
    // auth = await account.authentication;
    await googleSignIn.signInSilently();
    account = googleSignIn.currentUser;
    try{
       await account?.authentication;
    } on Exception catch(e){
        print(e);
    }

    
    
    
    setState(() {
      gotUser = true;
    });

    

  }

}

