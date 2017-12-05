import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:angular/angular.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'src/bird.dart';

@Injectable()
class InMemoryDataService extends MockClient {
  static final _initialBirds = [
    {'id': 1, 'name': 'Coleiro'},
    {'id': 2, 'name': 'Sabia'},
    {'id': 3, 'name': 'Trinca-ferro'}
  ];

  static List<Bird> _birdsDb;

  static int _nextId;

  static Future<Response> _handler(Request req) async {
    if (_birdsDb == null) resetDb();

    var data;

    if (req.method == 'GET') {
      final id = int.parse(req.url.pathSegments.last, onError: (_) => null);
      if (id != null) {
        data = _birdsDb.firstWhere((bird) => bird.id);
      } else {
        String prefix = req.url.queryParameters['name'] ?? '';
        final reqExp = new RegExp(prefix, caseSensitive: false);
        data = _birdsDb.where((bird) => bird.name.contains(reqExp)).toList();
      }
    } else if (req.method == 'POST') {
      var name = JSON.decode(req.body)['name'];
      var newBird = new Bird(_nextId++, name);
      _birdsDb.add(newBird);
      data = newBird;
    } else if (req.method == 'PUT') {
      var birdChange = new Bird.fromJson(JSON.decode(req.body));
      var birdTarget = _birdsDb.firstWhere((h) => h.id == birdChange.id);
      birdTarget.name = birdChange.name;
      data = birdTarget;
    } else if (req.method == 'DELETE') {
      var id = int.parse(req.url.pathSegments.last);
      _birdsDb.removeWhere((bird) => bird.id == id);
    } else {
      throw 'Nenhum method http valido!';
    }
  }

  static resetDb() {
    _birdsDb = _initialBirds.map((json) => new Bird.fromJson(json)).toList();
  }

  static String lookUpName(int id) =>
    _birdsDb.firstWhere((hero) => hero.id == id, orElse: null)?.name;

  InMemoryDataService() : super(_handler);

}
