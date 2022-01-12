import 'package:flutter/material.dart';
import '../../models/chatUsersModel.dart';
import '/widgets/conversationList.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'chatStream.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //final Stream<QuerySnapshot> _usersStream =
  //  FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Conversations",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.pink,
                            size: 20,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Add New",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            SizedBox(
              child: UserInformation(),
              height: 1000,
            ),
          ],
        ),
      ),
    );
  }
}

List<ChatUsers> chatUsers = [
  ChatUsers(
      name: "Jane Russel",
      messageText: "Awesome Setup",
      imageURL: "../../images/userImage1.jpeg",
      time: "Now"),
  ChatUsers(
      name: "Glady's Murphy",
      messageText: "That's Great",
      imageURL: "../../images/userImage2.jpeg",
      time: "Yesterday"),
  ChatUsers(
      name: "Jorge Henry",
      messageText: "Hey where are you?",
      imageURL: "../../images/userImage3.jpeg",
      time: "31 Mar"),
  ChatUsers(
      name: "Philip Fox",
      messageText: "Busy! Call me in 20 mins",
      imageURL: "../../images/userImage4.jpeg",
      time: "28 Mar"),
  ChatUsers(
      name: "Debra Hawkins",
      messageText: "Thankyou, It's awesome",
      imageURL: "../../images/userImage5.jpeg",
      time: "23 Mar"),
  ChatUsers(
      name: "Jacob Pena",
      messageText: "will update you in evening",
      imageURL: "../../images/userImage6.jpeg",
      time: "17 Mar"),
  ChatUsers(
      name: "Andrey Jones",
      messageText: "Can you please share the file?",
      imageURL: "../../images/userImage7.jpeg",
      time: "24 Feb"),
  ChatUsers(
      name: "John Wick",
      messageText: "How are you?",
      imageURL: "../../images/userImage8.jpeg",
      time: "18 Feb"),
];
