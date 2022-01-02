import 'package:flutter/material.dart';
import 'ViewListing.dart';


class liner extends StatelessWidget {
  String id;
  int rent;
  Image pic;
  String location;

  liner(this.rent, this.pic, this.location,this.id);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 500,
            height: 250,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(3),
            ),
            child: SizedBox.expand(
              child: FittedBox(
                child: InkWell(
                  splashColor: Colors.black26,
                  onTap: (){
                    // Navigator.pushReplacementNamed(
                    //   context,
                    //    '/viewlisting',
                    //     arguments: {'id': id});
                    // Navigator.of(context).pushReplacementNamed(
                    //    '/viewlisting',
                    //     arguments: {'id': id});
                    Navigator.push(context, MaterialPageRoute(
                    builder: 
                    (builder)=> Myapp(id: id)
                    ), ); 
                  },

                  
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