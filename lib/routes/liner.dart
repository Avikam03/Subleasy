import 'package:flutter/material.dart';

class liner extends StatelessWidget {
  int rent;
  Image pic;
  String location;

  liner(this.rent, this.pic, this.location);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 500,
            height: 250,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(3),
            ),
            child: SizedBox.expand(
              child: FittedBox(
                child: InkWell(
                  splashColor: Colors.black26,
                  onTap: () {},
                  child: pic,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(location, textAlign: TextAlign.center),
              ),
              Spacer(),
              Expanded(
                child: Text(
                  '\$$rent/mo',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          )
        ]);
  }
}