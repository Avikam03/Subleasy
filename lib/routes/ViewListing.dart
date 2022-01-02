import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Myapp extends StatefulWidget {
  final String id;

  Myapp({required this.id});

  @override
  _MyappState createState() => _MyappState();
}

// Map <dynamic, dynamic> data = Map();
Map listings = {'title':'',
'endmonth':'',
'Images':'',
'city':'',
'address':'',
'rent':'',
'startmonth':'',
'ownerid':'',
'description':'',
'duration':'',

};

        // listings['endmonth']= data['endmonth'];
        // listings['Images']= data['Images'];
        // listings['city']= data['city'];
        // listings['address']= data['address'];
        // listings['price']= data['price'];
        // listings['startmonth']= data['startmonth'];
        // listings['ownerid']= data['ownerid'];
        // listings['description']= data['description'];
        // listings['duration']= data['duration'];


class _MyappState extends State<Myapp> {

  
  

  late String id = widget.id;
  List<String> listPaths=["https://markstewart.com/wp-content/uploads/2020/06/MODERN-HOUSE-PLAN-MODERN-SEVEN-MM-2659-FRONT-VIEW-scaled.jpg"];


    @override
    void initState() {
      super.initState();

      FirebaseFirestore.instance.collection('listings').doc(widget.id).get()
      .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        Map data = documentSnapshot.data() as Map;
        print('Document data: ${data}');

        listings['title']= await data['title'];
        listings['endmonth']= await data['endmonth'];
        listings['Images']= await data['Images'];
        listings['city']= await data['city'];
        listings['address']= await data['address'];
        listings['rent']= await data['price'];
        listings['startmonth']= await data['startmonth'];
        listings['ownerid']= await data['ownerid'];
        listings['description']= await data['description'];
        listings['duration']= await data['duration'];

        print(listings);




        // print('Document data: ${documentSnapshot.data()}');
      }
      else{
        print("not working");
      }
      });


    }

  @override
  Widget build(BuildContext context) {

    var title1 = listings['title'];
        var city = listings['city']; 
        var desc = listings['description']; 
        var rent = listings['rent'];
        var Duration = listings['duration']; 
        var StartMonth = listings['startmonth'];
        var EndMonth = listings['endmonth'];
        var Address = listings['address'];

    if(city == ''){
      FirebaseFirestore.instance.collection('listings').doc(widget.id).get()
      .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        Map data = documentSnapshot.data() as Map;
        print('Document data: ${data}');

        title1= await data['title'];
        EndMonth= await data['endmonth'];
        city= await data['city'];
        Address= await data['address'];
        rent= await data['price'];
        StartMonth= await data['startmonth'];
        desc= await data['description'];
        Duration= await data['duration'];

        print(listings);




        // print('Document data: ${documentSnapshot.data()}');
      }
      else{
        print("not working");
      }
      });
    }


    return Scaffold(
          appBar: AppBar(
            title: Text(title1),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Slider(listPaths),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.pin_drop),
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Text(
                      city,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 20),
                    )
                  ]),
              SizedBox(
                height: 20,
                width: 10,
              ),
              Container(
                width: 350.0,
                height: 150.0,
                decoration: BoxDecoration(
                  color: Color(0xFFD3D3D3),
                  borderRadius: BorderRadius.all(const Radius.circular(15.0)),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Description',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      Expanded(child: Text(desc))
                    ]),
              ),
              Text(
                'Key Details',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Scrollbar(
                isAlwaysShown: true,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('Rent:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(rent)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Duration:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(Duration)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Start Month:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(StartMonth)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('End Month:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(EndMonth)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Address:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(Address)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
  }
}

class Slider extends StatefulWidget {
  List<String> listPaths;
  Slider(this.listPaths);

  @override
  SliderState createState() => SliderState(listPaths);
}

class SliderState extends State<Slider> {
  List<String> listPaths;
  SliderState(this.listPaths);

  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          width: 30,
        ),
        CarouselSlider.builder(
          itemCount: listPaths.length,
          options: CarouselOptions(
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPos = index;
                });
              }),
          itemBuilder: (context, index, _) {
            return MyImage(listPaths[index]);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listPaths.map((url) {
            int index = listPaths.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPos == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

class MyImage extends StatelessWidget {
  String imgpath;
  MyImage(this.imgpath);

  @override
  Widget build(BuildContext context) {
    return Image(image: NetworkImage(imgpath));
  }
}
