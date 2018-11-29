import 'package:flutter/material.dart';
import 'dart:math';
import 'picsum.dart';

class PicturesState extends State<Pictures> {
  final Set<String> _favorited = Set<String>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 64.0, bottom: 64.0),
      child: PageView(
        controller: PageController(viewportFraction: 0.85),
        children: List.generate(5, (i) => pageImage(i)),
      ),
    );
  }

  Padding pageImage(page) {
    String id = randomSelectedIdList[page];
    bool favorited = _favorited.contains(id);
    return Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                  offset: Offset(0.0, 4.0),
                ),
              ],
              image: DecorationImage(
                  image:
                      NetworkImage('https://picsum.photos/800/1400/?image=$id'),
                  fit: BoxFit.fitWidth)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: Icon(favorited ? Icons.favorite : Icons.favorite_border,
                    color: favorited ? Colors.red : Colors.white54),
                iconSize: 48,
                padding: EdgeInsets.all(16),
                onPressed: () {
                  setState(() {
                    if (favorited) {
                      _favorited.remove(id);
                    } else {
                      _favorited.add(id);
                    }
                  });
                },
              )
            ],
          ),
        ));
  }
}

class Pictures extends StatefulWidget {
  @override
  PicturesState createState() => PicturesState();
}
