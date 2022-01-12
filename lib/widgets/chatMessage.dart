import 'package:flutter/material.dart';

class chatMessage extends StatefulWidget {
  final String messageContent;
  final String messageType;
  const chatMessage(
      {Key? key, required this.messageContent, required this.messageType})
      : super(key: key);

  @override
  _chatMessageState createState() => _chatMessageState();
}

class _chatMessageState extends State<chatMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      child: Align(
        alignment: (widget.messageType == "receiver"
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (widget.messageType == "receiver"
                ? Colors.grey.shade200
                : Colors.blue[200]),
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            widget.messageContent,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
