import 'package:flutter/material.dart';

class PicturesState extends State<Pictures> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 64.0, bottom: 64.0),
      child: PageView(
        controller: PageController(viewportFraction: 0.85),
        children: <Widget>[
          /* Image(
            image: AssetImage('assets/images/textpic1.png'),
          ),
          Image(
            image: AssetImage('assets/images/textpic2.png'),
          ),
          Image(
            image: AssetImage('assets/images/textpic3.png'),
          ), */
          Image.network('https://picsum.photos/800/1350/?random'),
          Image.network('https://picsum.photos/800/1350/?random&'),
          Image.network('https://picsum.photos/800/1350/?random&&'),
        ],
      ),
    );
  }
}

class Pictures extends StatefulWidget {
  @override
  PicturesState createState() => PicturesState();
}
// memo なんかに入れてBoxFitする　bookreaderを参考にすればいける
