import 'dart:math';
import 'dart:convert';
const picsumList = '''
json was here
''';
var idAuthorMapList = json.decode(picsumList);

List<Map> randomSelectedList = List.generate(5, (i) => idAuthorMapList[Random().nextInt(idAuthorMapList.length)]);
