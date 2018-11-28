import 'package:flutter/material.dart';

class PicturesState extends State<Pictures> {
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 64.0, bottom: 64.0),
      child: PageView(
        controller: PageController(viewportFraction: 0.75),
        children: <Widget>[
          Text('ここに画像が入るよ1'),
          Text('ここに画像が入るよ2'),
          Text('ここに画像が入るよ3'),
        ],
      ),
    );
  }
}

class Pictures extends StatefulWidget {
  @override
  PicturesState createState() => PicturesState();
}