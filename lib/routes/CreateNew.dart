// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/services.dart';


// class CreateNew extends StatefulWidget {
//   CreateNew({Key? key}) : super(key: key);

//   @override
//   _CreateNewState createState() => _CreateNewState();
// }

// class _CreateNewState extends State<CreateNew> {
  
//   @override
//   Widget build(BuildContext context) {
//     return 
//     MaterialApp(
//       theme: ThemeData(
//       appBarTheme: const AppBarTheme(
//       color: Color(0xFF426BFF),
//     ),
//       primaryColor: const Color(0xFF426BFF),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//             primary: const Color(0xFF426BFF),
//           ),
//         ),
//       ),
//       home:const MyCustomForm(),
      
//     );



//     // return Material(
//     //   child: Column(
//     //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     //     // children: const [
//     //     //   Text('Create New Listing',
//     //     //   style: TextStyle(fontSize: 30, color: Color(0xff426BFF)),
//     //     //   ),
//     //       // TextFormField(
//     //       //   decoration: const InputDecoration(
//     //       //     hintText: 'Title',
//     //       //   ),
//     //       //   validator: (String? value) {
//     //       //     if (value == null || value.isEmpty) {
//     //       //       return 'Please enter some text';
//     //       //     }
//     //       //     return null;
//     //       //   },
//     //       // ),

//     //       // ElevatedButton(
//     //       //   style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
//     //       //   onPressed: (){
//     //       //     createNewListing();
//     //       //     ;},
//     //       //   child: const Text('Create'),
//     //       // ),
//     //     // ]
//     //   )
//     // );
//   }

  
// }

// class MyCustomForm extends StatefulWidget {
//   const MyCustomForm({Key? key}) : super(key: key);

//   @override
//   _MyCustomFormState createState() => _MyCustomFormState();
// }

// // Define a corresponding State class.
// // This class holds the data related to the Form.
// class _MyCustomFormState extends State<MyCustomForm> {
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final myController = TextEditingController();

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     myController.dispose();
//     super.dispose();
//   }

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final title = TextEditingController();
//   final description = TextEditingController();
//   final city = TextEditingController();
//   final address = TextEditingController();
//   final rent = TextEditingController();
//   final startingdate = TextEditingController();
//   final endingdate = TextEditingController();
//   final duration = TextEditingController();


//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Center(child: Text('Create New Listing')),
            
//           ),
//           body:
//         SingleChildScrollView(
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(),
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Container(
//                 margin: const EdgeInsets.only(top: 20.0), 
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
                
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Property\'s title',
//                         hintStyle: TextStyle(
//                           color: Colors.grey
                          
//                           ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter some text';
//                         }
//                         return null;
//                       },
//                       controller: title,
//                     ),
//                     const SizedBox(height: 15),
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Description',
//                         fillColor: Colors.grey,
//                         hintStyle: TextStyle(
//                           color: Colors.grey
                          
//                           ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter some text';
//                         }
//                         return null;
//                       },
//                       controller: description,
//                     ),
//                     const SizedBox(height: 15),
                
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         hintText: 'City',
//                         border: OutlineInputBorder(),
//                         hintStyle: TextStyle(
                          
//                           color: Colors.grey
                          
//                           ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter some text';
//                         }
//                         return null;
//                       },
//                       controller: city,
//                     ),
//                     const SizedBox(height: 15),
                
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         hintText: 'Address',
//                         border: OutlineInputBorder(),
//                         hintStyle: TextStyle(
//                           color: Colors.grey
                          
//                           ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter some text';
//                         }
//                         return null;
//                       },
//                       controller: address,
//                     ),
//                     const SizedBox(height: 15),
                
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         hintText: 'Rent (per month)',
//                         border: OutlineInputBorder(),
//                         hintStyle: TextStyle(
//                           color: Colors.grey
                          
//                           ),
//                       ),
//                       inputFormatters: <TextInputFormatter>[
//                       FilteringTextInputFormatter.digitsOnly],
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter some text';
//                         }
//                         return null;
//                       },
//                       controller: rent,
//                     ),
//                     const SizedBox(height: 15),
                    
//                     TextFormField(
                
//                       decoration: const InputDecoration(
//                         hintText: 'Starting Date',
//                         border: OutlineInputBorder(),
//                         hintStyle: TextStyle(
//                           color: Colors.grey
                          
//                           ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter some text';
//                         }
//                         return null;
//                       },
//                       controller: startingdate,
//                     ),
//                     SizedBox(height: 15),
                    
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         hintText: 'Ending Date',
//                         border: OutlineInputBorder(),
//                         hintStyle: TextStyle(
//                           color: Colors.grey
                          
//                           ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter some text';
//                         }
//                         return null;
//                       },
//                       controller: endingdate,
//                     ),
//                     SizedBox(height: 15),
                
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         hintText: 'Duration (in months)',
//                         border: OutlineInputBorder(),
//                         hintStyle: TextStyle(
//                           color: Colors.grey
                          
//                           ),
                        
//                       ),
//                       inputFormatters: <TextInputFormatter>[
//                       FilteringTextInputFormatter.digitsOnly],
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter some text';
//                         }
//                         return null;
//                       },
//                       controller: duration,
//                     ),
//                     SizedBox(height: 15),
                
                    
                
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 16.0),
//                       child: Center(

//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: SizedBox(
//                               width: double.infinity,

//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   // Validate will return true if the form is valid, or false if
//                                   // the form is invalid.
//                                   if (_formKey.currentState!.validate()) {
//                                     createNewListing();
//                                     // Process drata.
//                                   }
//                                 },
//                                 child: const Text('Submit'),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
                    
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//           ),
//       )
//     );
//   }

//   void createNewListing() {
//     FirebaseFirestore.instance.collection('listings')
//     .add({
//       'Images': {},
//       'address' : address.text,
//       'city' : city.text,
//       'description': description.text,
//       'duration': duration.text,
//       'endmonth': endingdate.text,
//       'ownerid': FirebaseAuth.instance.currentUser?.uid,
//       'price': rent.text,
//       'startmonth': startingdate.text,
//       'title': title.text,
//     })
//     .then((value) => print("listing Added"))
//     .catchError((err) => print("failed to add listing: $err"));

//     Navigator.pushReplacementNamed(context, '/mylistings');

//   }
  
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class CreateNew extends StatefulWidget {
  CreateNew({Key? key}) : super(key: key);

  @override
  _CreateNewState createState() => _CreateNewState();
}

class _CreateNewState extends State<CreateNew> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const MyCustomForm(),
    );

    // return Material(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     // children: const [
    //     //   Text('Create New Listing',
    //     //   style: TextStyle(fontSize: 30, color: Color(0xff426BFF)),
    //     //   ),
    //       // TextFormField(
    //       //   decoration: const InputDecoration(
    //       //     hintText: 'Title',
    //       //   ),
    //       //   validator: (String? value) {
    //       //     if (value == null || value.isEmpty) {
    //       //       return 'Please enter some text';
    //       //     }
    //       //     return null;
    //       //   },
    //       // ),

    //       // ElevatedButton(
    //       //   style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
    //       //   onPressed: (){
    //       //     createNewListing();
    //       //     ;},
    //       //   child: const Text('Create'),
    //       // ),
    //     // ]
    //   )
    // );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final title = TextEditingController();
  final description = TextEditingController();
  final city = TextEditingController();
  final address = TextEditingController();
  final rent = TextEditingController();
  final startingdate = TextEditingController();
  final endingdate = TextEditingController();
  final duration = TextEditingController();
  String dropdownValue = 'Select Starting Date';
  String dropdownValue1 = 'Select Ending Date';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('Create New Listing')),
            ),
            body: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Property\'s title',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: title,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Description',
                            fillColor: Colors.grey,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: description,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'City',
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: city,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Address',
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: address,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Rent (per month)',
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: rent,
                        ),
                        const SizedBox(height: 15),
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.lightBlue),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Select Starting Date',
                            'January',
                            'February',
                            'March',
                            'April',
                            'May',
                            'June',
                            'July',
                            'August',
                            'September',
                            'October',
                            'November',
                            'December'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 15),
                        DropdownButton<String>(
                          value: dropdownValue1,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.lightBlue),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue1 = newValue!;
                            });
                          },
                          items: <String>[
                            'Select Ending Date',
                            'January',
                            'February',
                            'March',
                            'April',
                            'May',
                            'June',
                            'July',
                            'August',
                            'September',
                            'October',
                            'November',
                            'December'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Duration (in months)',
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: duration,
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Validate will return true if the form is valid, or false if
                                    // the form is invalid.
                                    if (_formKey.currentState!.validate()) {
                                      createNewListing();
                                      // Process drata.
                                    }
                                  },
                                  child: const Text('Submit'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void createNewListing() {
    FirebaseFirestore.instance
        .collection('listings')
        .add({
          'Images': {},
          'address': address.text,
          'city': city.text,
          'description': description.text,
          'duration': duration.text,
          'endmonth': dropdownValue1,
          'ownerid': FirebaseAuth.instance.currentUser?.uid,
          'price': rent.text,
          'startmonth': dropdownValue,
          'title': title.text,
        })
        .then((value) => print("listing Added"))
        .catchError((err) => print("failed to add listing: $err"));

    Navigator.pushReplacementNamed(context, '/mylistings');
  }
}
