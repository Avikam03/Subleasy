import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chatapp/widgets/chatMessage.dart';

class Message extends StatefulWidget {
  @override
  _Message createState() => _Message();
}

class _Message extends State<Message> {
  final Stream<QuerySnapshot> _messageStream =
      FirebaseFirestore.instance.collection('messages/1001/1002').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _messageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return chatMessage(
              messageContent: data['MessageText'],
              messageType: data['MessageType'],
            );
          }).toList(),
        );
      },
    );
  }
}
