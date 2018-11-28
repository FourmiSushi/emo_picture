import 'package:flutter/material.dart';

void main() => runApp(EmoPictureApp());

class EmoPictureApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'EmoPicture',
      home: Scaffold(
        appBar: AppBar(
          title: Text('EmoLocation'),
        ),
      ),
    );
  }
}