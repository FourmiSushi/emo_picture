import 'package:flutter/material.dart';

class PicturesState extends State<Pictures> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 64.0, bottom: 64.0),
      child: PageView(
        controller: PageController(viewportFraction: 0.75),
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/textpic1.png'),
          ),
          Image(
            image: AssetImage('assets/images/textpic2.png'),
          ),
          Image(
            image: AssetImage('assets/images/textpic3.png'),
          ),
        ],
      ),
    );
  }
}

class Pictures extends StatefulWidget {
  @override
  PicturesState createState() => PicturesState();
}