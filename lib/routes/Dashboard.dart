// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


// bool nullCheck(object){
//   if(object == null){
//     return false;
//   }
//   else{
//     return true;
//   }
// }

// class Dashboard extends StatefulWidget {
//   Dashboard({Key? key}) : super(key: key);

//   @override
//   _DashboardState createState() => _DashboardState();
// }

 

// class _DashboardState extends State<Dashboard> {
//   String name = 'ok';

//   @override
//   void initState(){
//     super.initState();

//     FirebaseFirestore.instance 
//     .collection('users')
//     .doc(FirebaseAuth.instance.currentUser?.uid)
//     .get()
//     .then((DocumentSnapshot documentSnapshot) {
//       setState(() {
//         name = (documentSnapshot.data()! as Map)['name'];
//       });
      
//     });
//   }  
  
//   @override
//   Widget build(BuildContext context) {

//   print(name);
       
//     return Material(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           const Text('Dashboard',
//           style: TextStyle(fontSize: 30),
//           ),
//           Text(name),

//           RaisedButton(
//             child:
//              const Text(
//               "My Listings",
//               style: TextStyle(
//                 fontSize: 22,
//                 color: Color(0xff000000)
//               ),
//             ),
//             onPressed: (){
//               Navigator.pushReplacementNamed(context, '/mylistings');
//             }
//           ),


//           RaisedButton(
//             onPressed: (){
//               SignOut();
//             }
//           )
//         ]
//       )
//     );
//   }

//   void SignOut() async{
//     await FirebaseAuth.instance.signOut();
//     Navigator.pushReplacementNamed(context, '/');
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'liner.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String name = '';

  @override
  void initState() {
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

    return MyApp();
  }
}

class Property {
  String PrimaryLocation;
  String owner = '';
  String address;
  Image image;
  int rentMonth;
  String duration;

  Property(this.PrimaryLocation, this.owner, this.address, this.image,
      this.rentMonth, this.duration);
}

List<Property> dis = [];

// London, Waterloo, Toronto, Kitchner

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    void SignOut() async {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/');
    }

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Dashboad'),
            ),
            body: SingleChildScrollView(
              child: ConstrainedBox
              (
                constraints: const BoxConstraints(),
                child: Content()
                )),
            bottomNavigationBar: BottomAppBar(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                IconButton(onPressed: SignOut, icon: Icon(Icons.logout)),
                IconButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/mylistings'),
                    icon: Icon(Icons.add)),
                IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
              ],
            ))));
  }
}

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

var button1 = true;
var button2 = false;
var button3 = false;
var button4 = false;

String fun1(bool button1, bool button2, bool button3, bool button4) {
  if (button1) {
    String cur = 'Toronto';
    return cur;
  } else if (button2) {
    String cur = 'Waterloo';
    return cur;
  } else if (button3) {
    String cur = 'Kitchner';
    return cur;
  } else if (button4) {
    String cur = 'London';
    return cur;
  } else {
    String cur = '';
    return cur;
  }
}

var cur = fun1(button1, button2, button3, button4);

var x = dis.where((i) => (i.PrimaryLocation) == cur).toList();

var len = x.length;

class _ContentState extends State<Content> {
  var y = Column(
      children: x
          .map<Widget>((i) => liner(i.rentMonth, i.image, i.address))
          .toList());

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    final ButtonStyle clicked = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20), primary: Colors.grey);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 50.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: ElevatedButton(
                    style: button1 ? style : clicked,
                    onPressed: () {
                      setState(() {
                        button1 = true;
                        button2 = false;
                        button3 = false;
                        button4 = false;
                        cur = 'Toronto';

                        x = dis
                            .where((i) => (i.PrimaryLocation) == 'Toronto')
                            .toList();

                        len = x.length;

                        y = Column(
                            children: x
                                .map<Widget>((i) =>
                                    liner(i.rentMonth, i.image, i.address))
                                .toList());
                      });
                    },
                    child: const Text('Toronto'),
                  )),
              VerticalDivider(
                thickness: 1,
                color: Color(0xFFF6F4F4),
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: ElevatedButton(
                    style: button2 ? style : clicked,
                    onPressed: () {
                      setState(() {
                        button1 = false;
                        button2 = true;
                        button3 = false;
                        button4 = false;
                        cur = 'Waterloo';
                        x = dis
                            .where((i) => (i.PrimaryLocation) == 'Waterloo')
                            .toList();

                        len = x.length;

                        y = Column(
                            children: x
                                .map<Widget>((i) =>
                                    liner(i.rentMonth, i.image, i.address))
                                .toList());
                      });
                    },
                    child: const Text('Waterloo'),
                  )),
              VerticalDivider(
                thickness: 1,
                color: Color(0xFFF6F4F4),
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: ElevatedButton(
                    style: button3 ? style : clicked,
                    onPressed: () {
                      setState(() {
                        button1 = false;
                        button2 = false;
                        button3 = true;
                        button4 = false;
                        cur = 'Kitchner';

                        x = dis
                            .where((i) => (i.PrimaryLocation) == 'Kitchner')
                            .toList();

                        len = x.length;

                        y = Column(
                            children: x
                                .map<Widget>((i) =>
                                    liner(i.rentMonth, i.image, i.address))
                                .toList());
                      });
                    },
                    child: const Text('Kitchner'),
                  )),
              VerticalDivider(
                thickness: 1,
                color: Color(0xFFF6F4F4),
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: ElevatedButton(
                    style: button4 ? style : clicked,
                    onPressed: () {
                      setState(() {
                        button1 = false;
                        button2 = false;
                        button3 = false;
                        button4 = true;
                        cur = 'London';

                        x = dis
                            .where((i) => (i.PrimaryLocation) == 'London')
                            .toList();

                        len = x.length;

                        y = Column(
                            children: x
                                .map<Widget>((i) =>
                                    liner(i.rentMonth, i.image, i.address))
                                .toList());
                      });
                    },
                    child: const Text('London'),
                  )),
            ],
          ),
        ),
        Container(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "$len Listing Found",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            width: 200.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: Color(0xFF426BFF),
              borderRadius: BorderRadius.all(const Radius.circular(10.0)),
            )),
        SizedBox(height: 15),
        Container(
          height: 550.0,
          child: SingleChildScrollView(
            child: y,
          ),
        ),
      ],
    );
  }
}