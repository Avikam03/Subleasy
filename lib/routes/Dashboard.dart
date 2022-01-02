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

List listings = [];

List<Property> dis = [];


class _DashboardState extends State<Dashboard> {
  String name = '';
  // List listings = [];


  @override
  void initState() {
    super.initState();


    FirebaseFirestore.instance
    .collection('listings')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            listings.add(
              [doc['title'],
               doc['price'],
               doc['startmonth'],
               doc['endmonth'],
               doc['duration'],
               doc['Images'],
               doc['city'],
               doc.id
               ]);
            // print(doc["title"]);
        });
        
    });



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
    print(listings);

    for (var i = 0; i < listings.length; i++) {

      String title = listings[i][0];
      int price = double.parse(listings[i][1]).round(); 

     Image img = Image(image: NetworkImage(listings[i][5]['link']));
     String city = listings[i][6];
     String id = listings[i][7];

     var prop = Property(city, '', title, img, price, '',id); 
     dis.add(prop);      
    }

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
  String id;

  Property(this.PrimaryLocation, this.owner, this.address, this.image,
      this.rentMonth, this.duration,this.id);
}



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
              backgroundColor: const Color(0xFF426BFF),
              title:const Text('Dashboard'),
            ),
            body: SingleChildScrollView(
              child: ConstrainedBox
              (
                constraints: const BoxConstraints(),
                child: const Content()
                )),
            bottomNavigationBar: BottomAppBar(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
                IconButton(onPressed: SignOut, icon: const Icon(Icons.logout)),
                IconButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/mylistings'),
                    icon: const Icon(Icons.add)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.chat)),
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
          .map<Widget>((i) => liner(i.rentMonth, i.image, i.address,i.id))
          .toList());
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20,fontFamily: 'Roboto'),
          primary: const Color(0xFF426BFF),
        );
    final ButtonStyle clicked = ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20,fontFamily: 'Roboto'), primary: Colors.grey
        );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 50.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                                      liner(i.rentMonth, i.image, i.address,i.id))
                                  .toList());
                        });
                      },
                      child: const Text('Toronto'),
                    )),
                const VerticalDivider(
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
                                      liner(i.rentMonth, i.image, i.address,i.id))
                                  .toList());
                        });
                      },
                      child: const Text('Waterloo'),
                    )),
                const VerticalDivider(
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
                          cur = 'Kitchener';

                          x = dis
                              .where((i) => (i.PrimaryLocation) == 'Kitchener')
                              .toList();

                          len = x.length;

                          y = Column(
                              children: x
                                  .map<Widget>((i) =>
                                      liner(i.rentMonth, i.image, i.address,i.id))
                                  .toList());
                        });
                      },
                      child: const Text('Kitchener'),
                    )),
                const VerticalDivider(
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
                                      liner(i.rentMonth, i.image, i.address,i.id))
                                  .toList());
                        });
                      },
                      child: const Text('London'),
                    )),
              ],
            ),
          ),
        ),
        Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "$len Listing Found",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            width: 200.0,
            height: 40.0,
            decoration: const BoxDecoration(
              color: Color(0xFF426BFF),
              borderRadius: BorderRadius.all(const Radius.circular(15.0)),
            )),
        const SizedBox(height: 15),
        SizedBox(
          height: 550.0,
          child: SingleChildScrollView(
            child: y,
          ),
        ),
      ],
    );
  }
}