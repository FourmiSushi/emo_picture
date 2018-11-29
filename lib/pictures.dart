import 'package:flutter/material.dart';
import 'picsum.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PicturesState extends State<Pictures> {
  final Set<String> _favorited = Set<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EmoPicture'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list),onPressed: _pushfavorited,)
        ],
      ),
    body: Padding(
      padding: EdgeInsets.only(top: 64.0, bottom: 64.0),
      child: PageView(
        controller: PageController(viewportFraction: 0.85),
        children: List.generate(5, (i) => _pageImage(i)),
      ),
    ));
  }

  Padding _pageImage(page) {
    String id = randomSelectedList[page]['id'].toString();
    String author = randomSelectedList[page]['author'];
    String posturl = randomSelectedList[page]['post_url'];
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(favorited ? Icons.favorite : Icons.favorite_border,
                    color: favorited ? Colors.red : Colors.white54),
                iconSize: 48,
                padding: EdgeInsets.all(16),
                onPressed: () async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  setState(() {
                    if (favorited) {
                      _favorited.remove(id);
                      prefs.remove(id);
                    } else {
                      _favorited.add(id);
                      prefs.setString(id, posturl);
                    }
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  author,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 32,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _pushfavorited() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Navigator.of(context)
        .push(new MaterialPageRoute<void>(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _favorited.map((String fv) {
        return new ListTile(
          title: new Text('id: ' + fv),
          onTap: () => launch(prefs.getString(fv)),
        );
      });
      final List<Widget> divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();
      return new Scaffold(
          appBar: new AppBar(
            title: const Text('Favorites'),
            backgroundColor: Colors.black,
          ),
          body: new ListView(
            children: divided,
          ));
    }));
  }
}

class Pictures extends StatefulWidget {
  @override
  PicturesState createState() => PicturesState();
}
