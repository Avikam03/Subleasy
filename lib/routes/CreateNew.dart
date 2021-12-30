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
    return 
    const MaterialApp(
      home:MyCustomForm(),
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


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body:
      Container(
        margin: const EdgeInsets.only(top: 20.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Property\'s title',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: title,
            ),

            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: description,
            ),

            TextFormField(
              decoration: const InputDecoration(
                hintText: 'City',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: city,
            ),

            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Address',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: address,
            ),

            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Rent (per month)',
              ),
              inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly],
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: rent,
            ),
            
            TextFormField(

              decoration: const InputDecoration(
                hintText: 'Starting Date',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: startingdate,
            ),

            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Ending Date',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: endingdate,
            ),

            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Duration (in months)',
                
              ),
              inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly],
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: duration,
            ),

            

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    createNewListing();
                    // Process data.
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    )
    );
  }

  void createNewListing() {
    FirebaseFirestore.instance.collection('listings')
    .add({
      'Images': {},
      'address' : address.text,
      'city' : city.text,
      'description': description.text,
      'duration': duration.text,
      'endmonth': endingdate.text,
      'ownerid': FirebaseAuth.instance.currentUser?.uid,
      'price': rent.text,
      'startmonth': startingdate.text,
      'title': title.text,
    })
    .then((value) => print("listing Added"))
    .catchError((err) => print("failed to add listing: $err"));

  }
  
}